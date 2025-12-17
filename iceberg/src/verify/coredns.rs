//! Verifying CoreDNS.
//!
//! Contains code that parses CDNS memory dump, as well as
//! refinement proof steps.

use crate::middleend::se::builtin::golang::go_parse_type;
use crate::util::Nonce;
use crate::verify::*;
use serde_json::Value;
use std::collections::HashMap;
use std::io::{Read, Write};

pub const IR_FILE: &'static str = "test/coredns/lookup.O1.opt.oz.verify.ll";
pub const CONFIG_FILE: &'static str = "test/coredns/config.toml";
const MAX_LEN: usize = 8;

pub(super) fn verify(see: &mut See, test_suite: &str, test_id: &str) -> Panicable<()> {
    let start = std::time::Instant::now();
    let mut outfile = get_summary_outfile(
        "coredns",
        format!("verify/{test_suite}/{test_id}.sum").as_str(),
    );

    let file_ty = Type::resolve("%File.0")?;
    let file = make(
        see,
        file_ty,
        true,
        format!("{test_suite}/{test_id}/file.json").as_str(),
        "file",
    )?;
    let file = make_pointer(see, file, "Verify::File".into(), true);

    let request_ty = Type::resolve("%Request.0")?;
    let request = make(
        see,
        request_ty.clone(),
        false,
        format!("{test_suite}/{test_id}/request.json").as_str(),
        "request",
    )?;
    let request = make_pointer(see, request, "Verify::request".into(), true);

    let msg = {
        let desc = exp_as_data!(request, Exp::PointerLiteral).desc.clone();
        let ty = Type::mk_pointer();
        see.mstate_mut().load(ty, &desc, None).unwrap()
    };
    let (qname0, _) = make_symbolic_string(see, MAX_LEN, "Verify::qname".into(), false);

    // Install a symbolic query type
    let ty = Type::mk_bitvec(16);
    let qtype = make_symbolic(see, ty, "Verify::qtype".into());
    let desc = exp_as_data!(msg, Exp::PointerLiteral).desc.clone(); // &Msg
    let desc = {
        let ty = Type::resolve("%Msg.0")?;
        see.mstate_mut().get_elem_ptr(ty, &desc, 2).unwrap() // &Question
    };
    let qdesc = {
        let ty = Type::mk_pointer();
        exp_as_data!(
            see.mstate_mut().load(ty.clone(), &desc, None).unwrap(),
            Exp::PointerLiteral
        )
        .desc
        .clone()
    };
    let qtype_desc = {
        let ty = Type::resolve("%Question.0")?;
        see.mstate_mut().get_elem_ptr(ty, &qdesc, 1).unwrap()
    }; // &Question[0].qtype
    see.mstate_mut().store(&qtype_desc, qtype, true).unwrap();

    // Install a symbolic query name
    see.mstate_mut()
        .store(&qdesc, qname0.clone(), true)
        .unwrap(); // &Question[0].name.data

    // Go!
    let string_ty = typ!({ ptr, i64 });
    for len in 1..=MAX_LEN {
        let ldesc = see
            .mstate_mut()
            .get_elem_ptr(string_ty.clone(), &qdesc, 1)
            .unwrap(); // &Name.len
        let qname1 = Exp::int_literal(len as i64, Some(64))?;
        see.mstate_mut()
            .store(&ldesc, qname1.clone(), true)
            .unwrap();
        assert!(see.summarize(
            "verify_coredns".into(),
            &vec![file.clone(), request.clone()]
        ));
    }

    // Dump the summary
    let summary = see.sman().summary("verify_coredns");
    outfile
        .write_all(summary.to_string().as_bytes())
        .expect("failed to write summary");

    let elapsed = start.elapsed();
    println!(
        "[test-coredns] {test_suite}::{test_id} done ({:?})",
        elapsed
    );
    Ok(())
}

/// Using the JSON file `json_file_name` as description, setup `Exp`s in the
/// execution engine `see`, starting from memory name `root`.
///
/// The type `ty` is traversed recursively, and the JSON file is interpreted accordingly.
/// Whenever a pointer type is encountered, a memory region may allocated in the execution
/// engine to properly reflect the pointer value.
///
/// Returns an `Exp` that has the same type as `ty`.
fn make(
    see: &mut See,
    ty: Rc<Type>,
    constant: bool,
    json_file_name: &str,
    root: &str,
) -> Panicable<Rc<Exp>> {
    let mut file_path = std::env::current_dir().expect("failed to get current directory");
    file_path.push("test/coredns/json");
    file_path.push(json_file_name);
    let mut file = std::fs::OpenOptions::new()
        .read(true)
        .open(file_path)
        .expect("cannot open json file");
    let mut json = String::new();
    file.read_to_string(&mut json)
        .expect("cannot read from file");
    let value: Value = serde_json::from_str(&json).map_err(|err| make_panic!("{err}"))?;

    let mut nonce = Nonce::new();

    __make(
        see,
        ty,
        constant,
        &value,
        &value,
        Index::Str(root),
        &mut nonce,
    )
}

#[derive(Debug)]
enum Index<'a> {
    Str(&'a str),
    Num(usize),
}

const TYPE: &'static str = "__type__";
const VALUE: &'static str = "value";
const ZEROVAL: &'static str = "zeroVal";
const STRING: &'static str = "string";
const SLICE: &'static str = "Slice";
const SLICE_LEN: &'static str = "len";
const IFACE: &'static str = "Iface";
const IFACE_ITAB: &'static str = "itab";
const IFACE_DATA: &'static str = "data";
const MAP: &'static str = "map";
const NET_IP: &'static str = "net.IP";

/// Parse the itab string `itab` into an `Exp::PointerLiteral` that points to the type
/// and method set.
fn __itab_of(see: &mut See, itab: &str) -> Option<Rc<Exp>> {
    assert!(itab.starts_with("Itab"), "bad itab format: {itab}");
    let imt = match &itab[5..itab.len()-1] {
        "*dns.A" => "@pimt..interface.4Header.0func.8.9.8.1go.coredns.RR_Header.9.2.go.coredns.copy.0func.8.9.8go.coredns.RR.9.5..go.coredns.A",
        "*dns.AAAA" => "@pimt..interface.4Header.0func.8.9.8.1go.coredns.RR_Header.9.2.go.coredns.copy.0func.8.9.8go.coredns.RR.9.5..go.coredns.AAAA",
        "*dns.NS" => "@pimt..interface.4Header.0func.8.9.8.1go.coredns.RR_Header.9.2.go.coredns.copy.0func.8.9.8go.coredns.RR.9.5..go.coredns.NS",
        "*dns.RR_Header" => "@pimt..interface.4Header.0func.8.9.8.1go.coredns.RR_Header.9.2.go.coredns.copy.0func.8.9.8go.coredns.RR.9.5..go.coredns.RR_Header",
        "*dns.SOA" => "@pimt..interface.4Header.0func.8.9.8.1go.coredns.RR_Header.9.2.go.coredns.copy.0func.8.9.8go.coredns.RR.9.5..go.coredns.SOA",
        "*dns.CNAME" => "@pimt..interface.4Header.0func.8.9.8.1go.coredns.RR_Header.9.2.go.coredns.copy.0func.8.9.8go.coredns.RR.9.5..go.coredns.CNAME",
        "*dns.DNAME" => "@pimt..interface.4Header.0func.8.9.8.1go.coredns.RR_Header.9.2.go.coredns.copy.0func.8.9.8go.coredns.RR.9.5..go.coredns.DNAME",
        "*dns.OPT" => "@pimt..interface.4Header.0func.8.9.8.1go.coredns.RR_Header.9.2.go.coredns.copy.0func.8.9.8go.coredns.RR.9.5..go.coredns.OPT",
        "*dns.RRSIG" => "@pimt..interface.4Header.0func.8.9.8.1go.coredns.RR_Header.9.2.go.coredns.copy.0func.8.9.8go.coredns.RR.9.5..go.coredns.RRSIG",
        "*dns.SRV" => "@pimt..interface.4Header.0func.8.9.8.1go.coredns.RR_Header.9.2.go.coredns.copy.0func.8.9.8go.coredns.RR.9.5..go.coredns.SRV",
        "*dns.MX" => "@pimt..interface.4Header.0func.8.9.8.1go.coredns.RR_Header.9.2.go.coredns.copy.0func.8.9.8go.coredns.RR.9.5..go.coredns.MX",
        "*dns.TXT" => "@pimt..interface.4Header.0func.8.9.8.1go.coredns.RR_Header.9.2.go.coredns.copy.0func.8.9.8go.coredns.RR.9.5..go.coredns.TXT",
        "*dns.DS" => "@pimt..interface.4Header.0func.8.9.8.1go.coredns.RR_Header.9.2.go.coredns.copy.0func.8.9.8go.coredns.RR.9.5..go.coredns.DS",
        "*dns.NSEC" => "@pimt..interface.4Header.0func.8.9.8.1go.coredns.RR_Header.9.2.go.coredns.copy.0func.8.9.8go.coredns.RR.9.5..go.coredns.NSEC",
        "*dns.EDNS0_COOKIE"=> "@pimt..interface.4Option.0func.8.9.8uint16.9.2String.0func.8.9.8string.9.2.go.coredns.copy.0func.8.9.8go.coredns.EDNS0.9.5..go.coredns.EDNS0_COOKIE",
        _ => return None,
    };
    see.mstate()
        .get_global(imt.into(), true)
        .map(|desc| Exp::pointer_literal(desc))
}

fn __make(
    see: &mut See,
    ty: Rc<Type>,
    constant: bool,
    memory: &Value,
    parent: &Value,
    key: Index,
    nonce: &mut Nonce,
) -> Panicable<Rc<Exp>> {
    let Some(cur) = (match key {
        Index::Str(s) => parent.get(s),
        Index::Num(n) => parent.get(n),
    }) else {
        throw_panic!("key of {:?} not found", key)
    };

    // maps
    if let Some(obj) = cur
        .as_object()
        .filter(|obj| obj.get(TYPE).unwrap().as_str().unwrap().starts_with(MAP))
    {
        let (key, value) = obj
            .get(TYPE)
            .unwrap()
            .as_str()
            .unwrap()
            .split_once(']')
            .unwrap();
        assert_or_throw!(
            go_parse_type(&key[4..]).is_ok_and(|ty| type_is_kind!(ty, Type::BitVec)),
            "unsupported key type"
        );
        let vty = go_parse_type(value)?;
        let mut map = HashMap::<String, Rc<Exp>>::new();
        let map_name = format!("map${}", nonce.get());
        for key in cur.as_object().unwrap().keys() {
            if key.eq(TYPE) {
                continue;
            }

            let value = {
                let value = __make(
                    see,
                    vty.clone(),
                    constant,
                    memory,
                    cur,
                    Index::Str(key.as_str()),
                    nonce,
                )?;
                make_pointer(see, value, format!("{map_name}[{key}]").into(), true)
            };
            map.insert(key.clone(), value);
        }

        see.vstate_mut().put_abstract_map(map_name.clone(), map);
        return Ok(Exp::ident(ty, map_name.into()));
    }

    // zeroVal
    if cur.as_str().is_some_and(|s| s.eq(ZEROVAL)) {
        return Exp::zero_val(ty);
    }

    match ty.as_ref() {
        Type::Array(kind) => {
            assert_or_throw!(
                matches!(cur, Value::Array(v) if v.len() == kind.len),
                "expected type {ty}, found {cur}"
            );
            let elems = (0..kind.len)
                .map(|n| {
                    __make(
                        see,
                        kind.elem_ty.clone(),
                        constant,
                        memory,
                        cur,
                        Index::Num(n),
                        nonce,
                    )
                })
                .collect::<Panicable<Vec<_>>>()?;
            Exp::vector(ty.clone(), elems)
        }
        Type::Tuple(kind) => {
            let obj = cur
                .as_object()
                .ok_or_else(|| make_panic!("expected type {ty}, found {cur}"))?;
            let typ = obj.get(TYPE).unwrap().as_str().unwrap();

            // string literals
            if typ.eq(STRING) {
                let alloc_name = format!("string${}", nonce.get());
                let s = obj.get(VALUE).unwrap().as_str().unwrap();
                let (str0, str1) = make_string(see, s, alloc_name.into(), true);
                let str = Exp::tuple(vec![str0, str1], false);
                assert_or_throw!(type_eq!(ty, str.ty()), "expected type {ty}, found string");
                return Ok(str);
            }
            // interface
            if obj
                .get(IFACE_DATA)
                .is_some_and(|v| v.as_str().is_some_and(|s| s.starts_with(IFACE)))
            {
                let itab_str = obj.get(IFACE_ITAB).unwrap().as_str().unwrap();
                let Some(itab) = __itab_of(see, itab_str) else {
                    return Ok(Exp::havoc(ty));
                };
                let itab = Exp::bitcast(kind.fields[0].clone(), itab)?;
                let itab = see.exec(itab).unwrap();

                let data_ty = go_parse_type(&itab_str[5..itab_str.len() - 1])?;
                let data = __make(
                    see,
                    data_ty,
                    constant,
                    memory,
                    cur,
                    Index::Str(IFACE_DATA),
                    nonce,
                )?;
                let data = Exp::bitcast(kind.fields[1].clone(), data)?;
                let data = see.exec(data).unwrap();

                return Ok(Exp::tuple(vec![itab, data], false));
            }
            // struct
            let iter = cur
                .as_object()
                .ok_or_else(|| make_panic!("expected type {ty}, found {cur}"))?
                .keys()
                .filter(|key| !key.eq(&TYPE))
                .take(kind.fields.len());

            let mut fields = kind
                .fields
                .iter()
                .zip(iter)
                .map(|(ty, key)| {
                    __make(
                        see,
                        ty.clone(),
                        constant,
                        memory,
                        cur,
                        Index::Str(key.as_str()),
                        nonce,
                    )
                })
                .collect::<Panicable<Vec<_>>>()?;
            // ..pad with havoc
            fields.extend(
                kind.fields[fields.len()..]
                    .iter()
                    .map(|ty| Exp::havoc(ty.clone())),
            );
            Ok(Exp::tuple(fields, false))
        }

        Type::BitVec(kind) => {
            let Some(mut value) = cur.as_i64() else {
                throw_panic!("expected type {ty}, found {cur}");
            };
            let width = kind.width;
            if (1 << (width - 1)) & (value as usize) > 0 {
                value = value.wrapping_sub(1i64.wrapping_shl(width as u32));
            }
            Exp::int_literal(value, Some(kind.width))
        }

        Type::Pointer(_) => {
            let Some(ptr) = cur.as_str() else {
                if cur
                    .as_object()
                    .is_some_and(|obj| obj.get(TYPE).unwrap().eq("struct {}"))
                {
                    return Ok(Exp::havoc(ty));
                } else {
                    throw_panic!("expected type {ty}, found {cur}");
                }
            };
            if memory
                .get(ptr)
                .is_some_and(|v| v.as_object().is_some_and(|obj| obj.len() == 1))
            {
                // ..unexported type, having only the "__type__" field
                return Ok(Exp::havoc(ty));
            }
            let exp = if ptr.starts_with(SLICE) {
                // slice
                let slice = parent.as_object().unwrap();
                let len = slice.get(SLICE_LEN).unwrap().as_i64().unwrap() as usize;
                let typ = slice.get(TYPE).unwrap().as_str().unwrap();

                let elem_ty = if typ == NET_IP {
                    Type::mk_bitvec(8) // byte slice
                } else {
                    assert_or_throw!(typ.starts_with("[]"), "expect a slice type, found {typ}");
                    let Ok(elem_ty) = go_parse_type(&typ[2..]) else {
                        return Ok(Exp::havoc(ty));
                    };
                    elem_ty
                };

                let bty = Type::mk_array(len, elem_ty);
                __make(see, bty, constant, memory, memory, Index::Str(ptr), nonce)?
            } else {
                let ty = {
                    let Some(obj) = memory.get(ptr) else {
                        panic!("unknown pointer {ptr}")
                    };
                    let Some(typ) = obj.get(TYPE) else {
                        panic!("untyped pointee {}", obj)
                    };
                    go_parse_type(typ.as_str().unwrap()).unwrap()
                };
                __make(see, ty, constant, memory, memory, Index::Str(ptr), nonce)?
            };
            let ptr = make_pointer(see, exp, ptr.into(), constant);
            Ok(ptr)
        }

        Type::Enum(_) | Type::Int(_) | Type::Lambda(_) | Type::List(_) | Type::Unit(_) => {
            unreachable!("unexpected type")
        }
    }
}

// A Go string is { i8*, i64 }, which contains a char array and a length.
fn make_string(
    see: &mut See,
    str: &str,
    alloc_name: StringRef,
    constant: bool,
) -> (Rc<Exp>, Rc<Exp>) {
    let len = Exp::int_literal(str.len() as i64, Some(64)).get(see.traces());
    if str.len() > 0 {
        let array = make_char_array(see, str.as_bytes());
        (make_pointer(see, array, alloc_name, constant), len)
    } else {
        (Exp::null(), len)
    }
}

fn make_symbolic_string(
    see: &mut See,
    len: usize,
    alloc_name: StringRef,
    constant: bool,
) -> (Rc<Exp>, Rc<Exp>) {
    let len_exp = Exp::int_literal(len as i64, Some(64)).get(see.traces());
    if len > 0 {
        let array = make_symbolic_char_array(see, len, alloc_name.clone());
        (make_pointer(see, array, alloc_name, constant), len_exp)
    } else {
        (Exp::null(), len_exp)
    }
}

// A Go slice of type T is { T*, i64, i64 }, which contains a T array, a length and a capacity.
#[allow(unused)]
fn make_symbolic_byte_slice(see: &mut See, length: usize, alloc_name: StringRef) -> Rc<Exp> {
    let len = Exp::int_literal(length as i64, Some(64)).get(see.traces());
    let cap = Exp::int_literal(length as i64, Some(64)).get(see.traces());
    let array = make_symbolic_char_array(see, length, alloc_name.clone());
    let ptr = make_pointer(see, array, format!("{}::Raw", alloc_name).into(), false);
    let slice = {
        let ty = Type::mk_tuple([ptr.ty(), len.ty(), cap.ty()]);
        Exp::tuple(vec![ptr, len, cap], false)
    };
    make_pointer(see, slice, alloc_name, true)
}

#[allow(unused)]
fn make_string_slice(see: &mut See, strings: Vec<Rc<Exp>>, alloc_name: StringRef) -> Rc<Exp> {
    let len = Exp::int_literal(strings.len() as i64, Some(64)).get(see.traces());
    let cap = Exp::int_literal(strings.len() as i64, Some(64)).get(see.traces());
    let array = {
        let str_ty = {
            let pty = Type::mk_pointer();
            let ity = Type::mk_bitvec(64);
            Type::mk_tuple([pty, ity])
        };
        let ty = Type::mk_array(strings.len(), str_ty.clone());
        Exp::vector(ty, strings).get(see.traces())
    };
    let ptr = make_pointer(see, array, format!("{}::Raw", alloc_name).into(), false);
    let slice = {
        let ty = Type::mk_tuple([ptr.ty(), len.ty(), cap.ty()]);
        Exp::tuple(vec![ptr, len, cap], false)
    };
    make_pointer(see, slice, alloc_name, true)
}

#[cfg(test)]
mod refinement {
    use super::*;
    use crate::verify::get_summary_outfile;

    /// ```llvm
    /// i8 @go.coredns.IsFqdn(i8* nest nocapture readnone %nest.57, i8* %s.chunk0, i64 %s.chunk1)
    /// ```
    /// * Fully symbolic
    /// * Precondition used
    #[test]
    fn verify_cdns_isfqdn() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/IsFqdn.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));

        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let (str0, str1) = make_symbolic_string(&mut see, 8, "IsFqdn::s".into(), true);
            see.summarize("@go.coredns.IsFqdn".into(), &vec![unused, str0, str1])
        });

        let summary = see.sman().summary("@go.coredns.IsFqdn");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// { i8*, i64 } @go.coredns.Fqdn(i8* nest nocapture readnone %nest.72, i8* %s.chunk0, i64 %s.chunk1)
    /// ```
    /// * Fully symbolic
    /// * Precondition used
    #[test]
    fn verify_cdns_fqdn() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Fqdn.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));

        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let (str0, str1) = make_symbolic_string(&mut see, 8, "Fqdn::s".into(), true);
            see.summarize("@go.coredns.Fqdn".into(), &vec![unused, str0, str1])
        });

        let summary = see.sman().summary("@go.coredns.Fqdn");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// void @go.coredns.doDDD({ i8*, i64, i64 }* nocapture readonly byval %b)
    /// ```
    /// * Fully symbolic
    /// * Precondition used
    #[test]
    fn verify_cdns_doddd() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/doDDD.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));

        assert!({
            let slice = make_symbolic_byte_slice(&mut see, 11, "doDDD::Slice".into());
            see.summarize("@go.coredns.doDDD".into(), &vec![slice])
        });

        let summary = see.sman().summary("@go.coredns.doDDD");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// { i64, i8 } @go.coredns.PrevLabel(i8* nest nocapture readnone %nest.31, i8* nocapture readonly %s.chunk0, i64 %s.chunk1, i64 %n)
    /// ```
    /// * Fully symbolic
    /// * Precondition used
    #[test]
    fn verify_cdns_prevlabel() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/PrevLabel.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let (str0, str1) = make_symbolic_string(&mut see, 13, "PrevLabel::s".into(), true);
            let n = Exp::int_literal(1, Some(64))?;
            see.summarize("@go.coredns.PrevLabel".into(), &vec![unused, str0, str1, n])
        });
        let summary = see.sman().summary("@go.coredns.PrevLabel");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// { i64, i8 } @go.coredns.NextLabel(i8* nest nocapture readnone %nest.32, i8* nocapture readonly %s.chunk0, i64 %s.chunk1, i64 %offset)
    /// ```
    /// * Fully symbolic
    /// * Precondition used
    #[test]
    fn verify_cdns_nextlabel() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/NextLabel.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let (str0, str1) = make_symbolic_string(&mut see, 13, "NextLabel::s".into(), true);
            let offset = Exp::int_literal(1, Some(64))?;
            see.summarize(
                "@go.coredns.NextLabel".into(),
                &vec![unused, str0, str1, offset],
            )
        });
        let summary = see.sman().summary("@go.coredns.NextLabel");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// i64 @go.coredns.Less(i8* nest nocapture readnone %nest.48, %Elem.0* %a, i8* %name.chunk0, i64 %name.chunk1)
    /// ```
    /// * Partially symbolic
    /// * Precondition used
    #[test]
    fn verify_cdns_less() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Less.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let elem_ty = Type::resolve("%Elem.0")?;
            let elem = make(&mut see, elem_ty, true, "file.json", "40008085c0")?;
            let pelem = make_pointer(&mut see, elem, "Elem".into(), true);
            let (name0, name1) = make_symbolic_string(&mut see, 8, "Less::name".into(), true);
            see.summarize(
                "@go.coredns.Less".into(),
                &vec![unused, pelem, name0, name1],
            )
        });
        let summary = see.sman().summary("@go.coredns.Less");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// void @go.coredns.Split(%IPST.40* nocapture sret %sret.formal.14, i8* nest nocapture readnone %nest.36, i8* readonly %s.chunk0, i64 %s.chunk1)
    /// ```
    /// * Inlined
    #[test]
    fn verify_cdns_split() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Split.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let (str0, str1) = make_string(&mut see, "pku.edu.cn.", "Split::Test".into(), true);
            let sret = {
                let ty = Type::resolve("%IPST.40")?;
                let havoc = Exp::havoc(ty);
                make_pointer(&mut see, havoc, "Split::Sret".into(), false)
            };
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            see.summarize("@go.coredns.Split".into(), &vec![sret, unused, str0, str1])
        });
        let summary = see.sman().summary("@go.coredns.Split");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// void @go.coredns.SplitDomainName(%IPST.4* nocapture sret %sret.formal.15, i8* nest nocapture readnone %nest.39, i8* %s.chunk0, i64 %s.chunk1)
    /// ```
    #[test]
    fn verify_cdns_splitdomainname() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/SplitDomainName.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let (str0, str1) = make_string(
                &mut see,
                "pku.edu.cn.",
                "SplitDomainName::Test".into(),
                true,
            );
            let sret = {
                let ty = Type::resolve("%IPST.4")?;
                let havoc = Exp::havoc(ty);
                make_pointer(&mut see, havoc, "SplitDomainName::Sret".into(), false)
            };
            see.summarize(
                "@go.coredns.SplitDomainName".into(),
                &vec![sret, unused, str0, str1],
            )
        });
        let summary = see.sman().summary("@go.coredns.SplitDomainName");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// i64 @go.coredns.CountLabel(i8* nest nocapture readnone %nest.38, i8* readonly %s.chunk0, i64 %s.chunk1)
    /// ```
    /// * Fully symbolic
    /// * Precondition used
    #[test]
    fn verify_cdns_countlabel() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/CountLabel.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let (str0, str1) = make_symbolic_string(&mut see, 11, "CountLabel::s".into(), true);
            see.summarize("@go.coredns.CountLabel".into(), &vec![unused, str0, str1])
        });
        let summary = see.sman().summary("@go.coredns.CountLabel");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// i8 @go.coredns.equal(i8* nocapture readonly %a.chunk0, i64 %a.chunk1, i8* nocapture readonly %b.chunk0, i64 %b.chunk1)
    /// ```
    /// * Inlined
    #[test]
    fn verify_cdns_equal() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/equal.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let (a_str0, a_str1) =
                make_string(&mut see, "pku.edu.cn.", "equal::Test1".into(), true);
            let (b_str0, b_str1) =
                make_string(&mut see, "pku.edu.cn.", "equal::Test2".into(), false);
            see.summarize(
                "@go.coredns.equal".into(),
                &vec![a_str0, a_str1, b_str0, b_str1],
            )
        });
        let summary = see.sman().summary("@go.coredns.equal");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// i64 @go.coredns.CompareDomainName(i8* nest nocapture readnone %nest.35, i8* readonly %s1.chunk0, i64 %s1.chunk1, i8* readonly %s2.chunk0, i64 %s2.chunk1)
    /// ```
    /// * Oracle used
    /// * Partially symbolic
    #[test]
    fn verify_cdns_comparedomainname() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/CompareDomainName.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let (a_str0, a_str1) =
                make_string(&mut see, "pku.edu.", "CompareDomainName::s1".into(), true);
            let (b_str0, b_str1) =
                make_symbolic_string(&mut see, 12, "CompareDomainName::s2".into(), true);
            see.summarize(
                "@go.coredns.CompareDomainName".into(),
                &vec![unused, a_str0, a_str1, b_str0, b_str1],
            )
        });
        let summary = see.sman().summary("@go.coredns.CompareDomainName");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// i8 @go.coredns.IsSubDomain(i8* nest nocapture readnone %nest.27, i8* readonly %parent.chunk0, i64 %parent.chunk1, i8* readonly %child.chunk0, i64 %child.chunk1)
    /// ```
    /// * Partially symbolic
    /// * Precondition used
    #[test]
    fn verify_cdns_issubdomain() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/IsSubDomain.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let (a_str0, a_str1) =
                make_symbolic_string(&mut see, 8, "IsSubDomain::s1".into(), true);
            let (b_str0, b_str1) =
                make_string(&mut see, "abc.pku.edu.", "IsSubDomain::s2".into(), true);
            see.summarize(
                "@go.coredns.IsSubDomain".into(),
                &vec![unused, a_str0, a_str1, b_str0, b_str1],
            )
        });
        let summary = see.sman().summary("@go.coredns.IsSubDomain");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// { i8*, i64 } @go.coredns.Join(i8* nest nocapture readnone %nest.42, %IPST.4* nocapture readonly byval %labels)
    /// ```
    /// * Fully symbolic
    /// * Precondition used
    #[test]
    fn verify_cdns_join() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Join.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let strings = (0..3)
                .map(|i| {
                    let (str0, str1) = make_symbolic_string(
                        &mut see,
                        (i + 1) * 3,
                        format!("Join::s{i}").into(),
                        true,
                    );
                    Exp::tuple(vec![str0, str1], false)
                })
                .collect::<Vec<_>>();

            let labels = make_string_slice(&mut see, strings, "Join::labels".into());
            see.summarize("@go.coredns.Join".into(), &vec![unused, labels])
        });
        let summary = see.sman().summary("@go.coredns.Join");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// void @go.coredns.Apex.ns(%IPST.0* nocapture sret %sret.formal.9, i8* nest nocapture readnone %nest.23, %Apex.0* readonly %pointer, i8 zeroext %do)
    /// ```
    /// * Partially symbolic
    #[test]
    fn verify_cdns_apex_ns() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Apex.ns.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let sret = {
                let ty = Type::resolve("%IPST.0")?;
                let havoc = Exp::havoc(ty);
                make_pointer(&mut see, havoc, "Apex.ns::Sret".into(), false)
            };
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };

            let zone_ty = Type::resolve("%Zone.0")?;
            let zone = make(&mut see, zone_ty, true, "file.json", "40002ac3b0")?;
            let pzone = make_pointer(&mut see, zone.clone(), "Apex.ns::zone".into(), true);
            let apex = {
                let index = Exp::int_literal(4, Some(64))?;
                Exp::get_elem_ptr(zone.ty(), pzone, index, true)?
            };
            let _do = {
                let ty = Type::mk_bitvec(8);
                make_symbolic(&mut see, ty, "Apex.ns::do".into())
            };

            see.summarize("@go.coredns.Apex.ns".into(), &vec![sret, unused, apex, _do])
        });
        let summary = see.sman().summary("@go.coredns.Apex.ns");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// void @go.coredns.Apex.soa(%IPST.0* nocapture sret %sret.formal.8, i8* nest nocapture readnone %nest.22, %Apex.0* readonly %pointer, i8 zeroext %do)
    /// ```
    /// * Partially symbolic
    #[test]
    fn verify_cdns_apex_soa() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Apex.soa.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let sret = {
                let ty = Type::resolve("%IPST.0")?;
                let havoc = Exp::havoc(ty);
                make_pointer(&mut see, havoc, "Apex.soa::Sret".into(), false)
            };
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };

            let zone_ty = Type::resolve("%Zone.0")?;
            let zone = make(&mut see, zone_ty, true, "file.json", "40002ac3b0")?;
            let pzone = make_pointer(&mut see, zone.clone(), "Apex.soa::zone".into(), true);
            let apex = {
                let index = Exp::int_literal(4, Some(64))?;
                Exp::get_elem_ptr(zone.ty(), pzone, index, true)?
            };
            let _do = {
                let ty = Type::mk_bitvec(8);
                make_symbolic(&mut see, ty, "Apex.soa::do".into())
            };

            see.summarize(
                "@go.coredns.Apex.soa".into(),
                &vec![sret, unused, apex, _do],
            )
        });
        let summary = see.sman().summary("@go.coredns.Apex.soa");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// void @go.coredns.Zone.nameFromRight({ { i8*, i64 }, i8 }* nocapture sret %sret.formal.3, i8* nest nocapture readnone %nest.12, %Zone.0* readonly %z, i8* %qname.chunk0, i64 %qname.chunk1, i64 %i)
    /// ```
    /// * Partially symbolic
    /// * Precondition used
    #[test]
    fn verify_cdns_zone_namefromright() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Zone.nameFromRight.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let sret = {
                let ty = typ!({ { ptr, i64 }, i8 });
                let havoc = Exp::havoc(ty);
                make_pointer(&mut see, havoc, "Zone.nameFromRight::Sret".into(), false)
            };
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };

            let zone_ty = Type::resolve("%Zone.0")?;
            let zone = make(&mut see, zone_ty, true, "file.json", "40002ac3b0")?;
            let pzone = make_pointer(&mut see, zone, "nameFromRight::zone".into(), true);
            let (qname0, qname1) =
                make_symbolic_string(&mut see, 8, "nameFromRight::qname".into(), true);
            let i = Exp::int_literal(1, Some(64))?;
            see.summarize(
                "@go.coredns.Zone.nameFromRight".into(),
                &vec![sret, unused, pzone, qname0, qname1, i],
            )
        });
        let summary = see.sman().summary("@go.coredns.Zone.nameFromRight");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// void @go.coredns.Elem.TypeForWildcard(%IPST.0* nocapture sret %sret.formal.5, i8* nest nocapture readnone %nest.17, %Elem.0* readonly %e, i16 zeroext %qtype, i8* %qname.chunk0, i64 %qname.chunk1)
    /// ```
    /// * Partially symbolic
    #[test]
    fn verify_cdns_elem_typeforwildcard() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Elem.TypeForWildcard.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let sret = {
                let ty = Type::resolve("%IPST.0")?;
                let havoc = Exp::havoc(ty);
                make_pointer(&mut see, havoc, "Elem.TypeForWildcard::Sret".into(), false)
            };
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let elem_ty = Type::resolve("%Elem.0")?;
            let elem = make(&mut see, elem_ty, true, "file.json", "40008085c0")?;
            let pelem = make_pointer(&mut see, elem, "Elem".into(), true);
            let qtype = {
                let ty = Type::mk_bitvec(16);
                make_symbolic(&mut see, ty, "Elem.TypeForWildcard::qtype".into())
            };
            let (qname0, qname1) =
                make_symbolic_string(&mut see, 8, "Elem.TypeForWildcard::qname".into(), true);

            see.summarize(
                "@go.coredns.Elem.TypeForWildcard".into(),
                &vec![sret, unused, pelem, qtype, qname0, qname1],
            )
        });
        let summary = see.sman().summary("@go.coredns.Elem.TypeForWildcard");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// { i8*, i64 } @go.coredns.Elem.Name(i8* nest nocapture readnone %nest.16, %Elem.0* %e)
    /// ```
    /// * Concrete
    #[test]
    fn verify_cdns_elem_name() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Elem.Name.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let elem_ty = Type::resolve("%Elem.0")?;
            let elem = make(&mut see, elem_ty, true, "file.json", "40008085c0")?;
            let pelem = make_pointer(&mut see, elem, "Elem".into(), true);
            see.summarize("@go.coredns.Elem.Name".into(), &vec![unused, pelem])
        });
        let summary = see.sman().summary("@go.coredns.Elem.Name");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// void @go.coredns.Elem.Type(%IPST.0* nocapture sret %sret.formal.4, i8* nest nocapture readnone %nest.15, %Elem.0* readonly %e, i16 zeroext %qtype)
    /// ```
    /// * Partially symbolic
    #[test]
    fn verify_cdns_elem_type() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Elem.Type.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let sret = {
                let ty = Type::resolve("%IPST.0")?;
                let havoc = Exp::havoc(ty);
                make_pointer(&mut see, havoc, "Elem.Type::Sret".into(), false)
            };
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let elem_ty = Type::resolve("%Elem.0")?;
            let elem = make(&mut see, elem_ty, true, "file.json", "40008085c0")?;
            let pelem = make_pointer(&mut see, elem, "Elem".into(), true);
            let qtype = {
                let ty = Type::mk_bitvec(16);
                make_symbolic(&mut see, ty, "Elem.Type::qtype".into())
            };
            see.summarize(
                "@go.coredns.Elem.Type".into(),
                &vec![sret, unused, pelem, qtype],
            )
        });
        let summary = see.sman().summary("@go.coredns.Elem.Type");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// void @go.coredns.typeFromElem(%IPST.0* nocapture sret %sret.formal.7, %Elem.0* readonly %elem, i16 zeroext %tp, i8 zeroext %do)
    /// ```
    /// * Partially symbolic
    #[test]
    fn verify_cdns_typefromelem() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/typeFromElem.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let sret = {
                let ty = Type::resolve("%IPST.0")?;
                let havoc = Exp::havoc(ty);
                make_pointer(&mut see, havoc, "typeFromElem::Sret".into(), false)
            };
            let elem_ty = Type::resolve("%Elem.0")?;
            let elem = make(&mut see, elem_ty, true, "file.json", "40008085c0")?;
            let pelem = make_pointer(&mut see, elem, "Elem".into(), true);
            let tp = {
                let ty = Type::mk_bitvec(16);
                make_symbolic(&mut see, ty, "typeFromElem::qtype".into())
            };
            let _do = {
                let ty = Type::mk_bitvec(8);
                make_symbolic(&mut see, ty, "typeFromElem::do".into())
            };
            see.summarize(
                "@go.coredns.typeFromElem".into(),
                &vec![sret, pelem, tp, _do],
            )
        });
        let summary = see.sman().summary("@go.coredns.typeFromElem");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman().summary("@go.coredns.SubTypeSignature");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// { i8*, i8 } @go.coredns.Tree.Search(i8* nest nocapture readnone %nest.8, %Tree.0* readonly %t, i8* %qname.chunk0, i64 %qname.chunk1)
    /// ```
    /// * Partially symbolic
    #[test]
    fn verify_cdns_tree_search() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Tree.Search.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let tree_ty = Type::resolve("%Tree.0")?;
            let tree = make(&mut see, tree_ty, true, "file.json", "4000124188")?;
            let ptree = make_pointer(&mut see, tree, "Tree".into(), true);
            let (qname0, qname1) =
                make_symbolic_string(&mut see, 8, "Tree.Search::qname".into(), false);
            see.summarize(
                "@go.coredns.Tree.Search".into(),
                &vec![unused, ptree, qname0, qname1],
            )
        });
        let summary = see.sman().summary("@go.coredns.Tree.Search");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// { i8*, i8 } @go.coredns.Zone.ClosestEncloser(i8* nest nocapture readnone %nest.13, %Zone.0* readonly %z, i8* %qname.chunk0, i64 %qname.chunk1)
    /// ```
    /// * Partially symbolic
    #[test]
    fn verify_cdns_zone_closestencloser() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Zone.ClosestEncloser.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let zone_ty = Type::resolve("%Zone.0")?;
            let zone = make(&mut see, zone_ty, true, "file.json", "40002ac3b0")?;
            let pzone = make_pointer(&mut see, zone, "ClosestEncloser::zone".into(), true);
            let (qname0, qname1) =
                make_symbolic_string(&mut see, 8, "ClosestEncloser::qname".into(), false);
            see.summarize(
                "@go.coredns.Zone.ClosestEncloser".into(),
                &vec![unused, pzone, qname0, qname1],
            )
        });
        let summary = see.sman().summary("@go.coredns.Zone.ClosestEncloser");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// { i8*, i8 } @go.coredns.Tree.Next(i8* nest nocapture readnone %nest.11, %Tree.0* readonly %t, i8* %qname.chunk0, i64 %qname.chunk1)
    /// ```
    /// * Partially symbolic
    /// * Precondition used
    #[test]
    fn verify_cdns_tree_next() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Tree.Next.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let tree_ty = Type::resolve("%Tree.0")?;
            let tree = make(&mut see, tree_ty, true, "file.json", "4000124188")?;
            let ptree = make_pointer(&mut see, tree, "Tree".into(), true);

            let (qname0, qname1) =
                make_symbolic_string(&mut see, 8, "Tree.Next::qname".into(), false);

            see.summarize(
                "@go.coredns.Tree.Next".into(),
                &vec![unused, ptree, qname0, qname1],
            )
        });
        let summary = see.sman().summary("@go.coredns.Tree.Next");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// { i8*, i8 } @go.coredns.Tree.Prev(i8* nest nocapture readnone %nest.10, %Tree.0* readonly %t, i8* %qname.chunk0, i64 %qname.chunk1)
    /// ```
    /// * Partially symbolic
    /// * Precondition used
    #[test]
    fn verify_cdns_tree_prev() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Tree.Prev.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let tree_ty = Type::resolve("%Tree.0")?;
            let tree = make(&mut see, tree_ty, true, "file.json", "4000124188")?;
            let ptree = make_pointer(&mut see, tree, "Tree".into(), true);

            let (qname0, qname1) =
                make_symbolic_string(&mut see, 6, "Tree.Prev::qname".into(), false);

            see.summarize(
                "@go.coredns.Tree.Prev".into(),
                &vec![unused, ptree, qname0, qname1],
            )
        });
        let summary = see.sman().summary("@go.coredns.Tree.Prev");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// void @go.coredns.Tree.searchGlue(%IPST.0* nocapture sret %sret.formal.2, i8* nest nocapture readnone %nest.7, %Tree.0* %t, i8* %name.chunk0, i64 %name.chunk1, i8 zeroext %do)
    /// ```
    /// * Partially symbolic
    #[test]
    fn verify_cdns_tree_searchglue() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Tree.searchGlue.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let sret = {
                let ty = Type::resolve("%IPST.0")?;
                let havoc = Exp::havoc(ty);
                make_pointer(&mut see, havoc, "Tree.searchGlue::Sret".into(), false)
            };
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let tree_ty = Type::resolve("%Tree.0")?;
            let tree = make(&mut see, tree_ty, true, "file.json", "4000124188")?;
            let ptree = make_pointer(&mut see, tree, "Tree".into(), true);
            let (qname0, qname1) =
                make_symbolic_string(&mut see, 8, "Tree.searchGlue::qname".into(), false);
            let _do = {
                let ty = Type::mk_bitvec(8);
                make_symbolic(&mut see, ty, "Tree.searchGlue::do".into())
            };
            see.summarize(
                "@go.coredns.Tree.searchGlue".into(),
                &vec![sret, unused, ptree, qname0, qname1, _do],
            )
        });
        let summary = see.sman().summary("@go.coredns.Tree.searchGlue");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// void @go.coredns.Tree.Glue(%IPST.0* nocapture sret %sret.formal.1, i8* nest nocapture readnone %nest.6, %Tree.0* %t, %IPST.0* nocapture readonly byval %nsrrs, i8 zeroext %do)
    /// ```
    #[test]
    fn verify_cdns_tree_glue() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Tree.Glue.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let sret = {
                let ty = Type::resolve("%IPST.0")?;
                let havoc = Exp::havoc(ty);
                make_pointer(&mut see, havoc, "Tree.Glue::Sret".into(), false)
            };
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty)
            };
            let tree_ty = Type::resolve("%Tree.0")?;
            let tree = make(&mut see, tree_ty, true, "file.json", "4000124188")?;
            let ptree = make_pointer(&mut see, tree, "Tree".into(), true);

            let zone_ty = Type::resolve("%Zone.0")?;
            let zone = make(&mut see, zone_ty, true, "file.json", "40002ac3b0")?;
            let pzone = make_pointer(&mut see, zone.clone(), "Tree.Glue::zone".into(), true);

            let apex = {
                let index = Exp::int_literal(4, Some(32))?;
                Exp::get_elem_ptr(zone.ty(), pzone, index, true)?
            };
            let nsrrs = {
                let ty = Type::resolve("%Apex.0")?;
                let index = Exp::int_literal(1, Some(32))?;
                Exp::get_elem_ptr(ty, apex, index, true)?
            };
            let _do = {
                let ty = Type::mk_bitvec(8);
                make_symbolic(&mut see, ty, "Tree.Glue::do".into())
            };
            see.summarize(
                "@go.coredns.Tree.Glue".into(),
                &vec![sret, unused, ptree, nsrrs, _do],
            )
        });
        let summary = see.sman().summary("@go.coredns.Tree.Glue");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// void @go.coredns.Zone.Lookup({ %IPST.0, %IPST.0, %IPST.0, i64 }* sret %sret.formal.0, i8* nest nocapture readnone %nest.0, %Zone.0* %z, i8* %ctx.chunk0, i8* %ctx.chunk1, %Request.0* byval %state, i8* %qname.chunk0, i64 %qname.chunk1)
    /// ```
    /// * Partially symbolic (name only)
    #[test]
    fn verify_cdns_zone_lookup() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/Zone.Lookup.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let sret = {
                let ty = typ!({ "%IPST.0", "%IPST.0", "%IPST.0", i64 });
                let havoc = Exp::havoc(ty);
                make_pointer(&mut see, havoc, "Zone.Lookup::Sret".into(), false)
            };
            let (unused, loop_count) = {
                let ty = Type::mk_pointer();
                (Exp::havoc(ty.clone()), Exp::null())
            };

            let zone_ty = Type::resolve("%Zone.0")?;
            let zone = make(&mut see, zone_ty, true, "file.json", "40002ac3b0")?;
            let zone = make_pointer(&mut see, zone, "Zone.Lookup::Zone".into(), true);

            let request_ty = Type::resolve("%Request.0")?;
            let request = make(&mut see, request_ty, true, "request.json", "request")?;
            let request = make_pointer(&mut see, request, "Zone.Lookup::Request".into(), false);

            // let (qname0, qname1) = make_string(&mut see, "www.example.org.", "Zone.Lookup::qname", true);
            let (qname0, qname1) =
                make_symbolic_string(&mut see, 8, "Zone.Lookup::qname".into(), false);

            see.summarize(
                "@go.coredns.Zone.Lookup".into(),
                &vec![
                    sret,
                    unused.clone(),
                    zone,
                    loop_count,
                    unused.clone(),
                    request,
                    qname0,
                    qname1,
                ],
            )
        });
        let summary = see.sman().summary("@go.coredns.Zone.Lookup");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman().summary("@go.coredns.Node.search");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    /// ```llvm
    /// void @go.coredns.File.ServeDNS({ i64, %error.0 }* nocapture sret %sret.formal.0, i8* nest nocapture readnone %nest.0,
    ///      %File.0* readonly %pointer, i8* %ctx.chunk0, i8* %ctx.chunk1, i8* %w.chunk0, i8* %w.chunk1, %Msg.0* %r)
    /// ```
    #[test]
    fn verify_cdns_file_serve_dns() -> Panicable<()> {
        let mut file = get_summary_outfile("coredns", "verify/File.ServeDNS.txt");
        let mut see = crate::glue::llvm::parse(IR_FILE, Some(CONFIG_FILE));
        assert!({
            let sret = {
                let ty = typ!({ i64, "%error.0" });
                let havoc = Exp::havoc(ty);
                make_pointer(&mut see, havoc, "File.ServeDNS::Sret".into(), false)
            };
            let unused = {
                let ty = Type::mk_pointer();
                Exp::havoc(ty.clone())
            };
            let loop_count = Exp::null();

            let file_ty = Type::resolve("%File.0")?;
            let file = make(&mut see, file_ty, true, "file.json", "file")?;
            let pointer = make_pointer(&mut see, file, "File.ServeDNS::File".into(), true);

            let request_ty = Type::resolve("%Request.0")?;
            let request = make(
                &mut see,
                request_ty.clone(),
                false,
                "request.json",
                "request",
            )?;
            let request = make_pointer(&mut see, request, "File.ServeDNS::request".into(), true);

            let msg = {
                let desc = exp_as_data!(request, Exp::PointerLiteral).desc.clone();
                let ty = Type::mk_pointer();
                see.mstate_mut().load(ty, &desc, None).unwrap()
            };
            let (qname0, qname1) =
                make_symbolic_string(&mut see, 8, "File.ServeDNS::qname".into(), false);

            // Install a symbolic query type
            let ty = Type::mk_bitvec(16);
            let qtype = make_symbolic(&mut see, ty, "File.ServeDNS::qtype".into());
            let desc = exp_as_data!(msg, Exp::PointerLiteral).desc.clone(); // &Msg
            let desc = {
                let ty = Type::resolve("%Msg.0")?;
                see.mstate_mut().get_elem_ptr(ty, &desc, 2).unwrap() // &Question
            };
            let qdesc = {
                let ty = Type::mk_pointer();
                exp_as_data!(
                    see.mstate_mut().load(ty.clone(), &desc, None).unwrap(),
                    Exp::PointerLiteral
                )
                .desc
                .clone()
            };
            let qtype_desc = {
                let ty = Type::resolve("%Question.0")?;
                see.mstate_mut().get_elem_ptr(ty, &qdesc, 1).unwrap()
            }; // &Question[0].qtype
            see.mstate_mut().store(&qtype_desc, qtype, true).unwrap();

            // Install a symbolic query name
            let qname = Exp::tuple(vec![qname0, qname1], false);
            see.mstate_mut().store(&qdesc, qname, true).unwrap();

            see.summarize(
                "@go.coredns.File.ServeDNS".into(),
                &vec![
                    sret,
                    unused.clone(),
                    pointer,
                    loop_count,
                    unused.clone(),
                    unused.clone(),
                    unused,
                    msg,
                ],
            )
        });
        let summary = see.sman().summary("@go.coredns.File.ServeDNS");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman().summary("@go.coredns.Matches");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }
}
