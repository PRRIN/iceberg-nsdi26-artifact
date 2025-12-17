use crate::verify::*;
use itertools::*;
use serde_json::Value;
use std::collections::HashMap;
use std::io::{Read, Write};

pub const IR_FILE: &'static str = "test/pdns/pdns.opt.oz.verify.ll";
pub const CONFIG_FILE: &'static str = "test/pdns/config.toml";
const MAX_LABEL: usize = 4;
const MAX_LEN: usize = 2 * MAX_LABEL + 1;

pub(super) fn verify(see: &mut See, test_suite: &str, test_id: &str) -> Panicable<()> {
    let start = std::time::Instant::now();
    let mut outfile = get_summary_outfile(
        "pdns",
        format!("verify/{test_suite}/{test_id}.sum").as_str(),
    );

    let descs = setup(see, format!("{test_suite}/{test_id}/ctx.json").as_str());

    let packet = {
        let (_, packet) = descs
            .iter()
            .find(|(type_name, _)| type_name.eq("%class.DNSPacket"))
            .unwrap();
        Exp::pointer_literal(packet.clone())
    };

    let handler = {
        let (_, handler) = descs
            .iter()
            .find(|(type_name, _)| type_name.eq("%class.PacketHandler.3481"))
            .unwrap();
        Exp::pointer_literal(handler.clone())
    };

    // Put `DomainInfo` and `Bind2DNSRecordExt`s into abstract maps
    let info = "DOMAIN_INFO";
    let records = "RECORDS";

    // info
    let (info_map, info_exp) = {
        let (_, info) = descs
            .iter()
            .find(|(type_name, _)| type_name.eq("%class.BB2DomainInfo"))
            .unwrap();

        // // store the records map
        // let ty = Type::resolve("%class.BB2DomainInfo").unwrap();
        // let desc = see.mstate_mut().get_elem_ptr(ty, info, 6).unwrap(); // bbd->d_records
        // see
        //     .mstate_mut()
        //     .store(&desc, d_records, true)
        //     .unwrap();

        let mut map = HashMap::new();
        let info_exp = Exp::pointer_literal(info.clone());
        _ = map.insert("_".to_string(), info_exp.clone());
        (map, info_exp)
    };
    see.vstate_mut()
        .put_abstract_map(info.to_string(), info_map);

    // records
    let records_map = descs
        .iter()
        .filter(|(type_name, _)| type_name.eq("%struct.Bind2DNSRecordExt"))
        .enumerate()
        .map(|(i, (_, record))| (i.to_string(), Exp::pointer_literal(record.clone())))
        .collect();
    see.vstate_mut()
        .put_abstract_map(records.to_string(), records_map);

    // Get `qname` and `qtype`
    let (p_qdomain, p_qtype) = {
        let (_, packet) = descs
            .iter()
            .find(|(type_name, _)| type_name.eq("%class.DNSPacket"))
            .unwrap();
        let qdomain = see
            .mstate_mut()
            .get_elem_ptr(Type::resolve("%class.DNSPacket").unwrap(), &packet, 2)
            .unwrap();
        let qtype = see
            .mstate_mut()
            .get_elem_ptr(Type::resolve("%class.DNSPacket").unwrap(), &packet, 14)
            .unwrap();
        (qdomain, qtype)
    };

    // Install a symbolic qtype
    let qtype = make_symbolic(see, Type::mk_bitvec(16), "Verify::qtype".into());
    see.mstate_mut().store(&p_qtype, qtype, true).unwrap();

    // Install a symbolic qname
    let (qdata_desc, qdata_bytes) = {
        let ty = Type::resolve("%\"class.std::__cxx11::basic_string\"").unwrap();
        let qdata = see.mstate_mut().get_elem_ptr(ty, &p_qdomain, 2).unwrap();

        let bytes = (0..MAX_LEN)
            .map(|i| {
                make_symbolic(
                    see,
                    Type::mk_bitvec(8),
                    format!("Verify::qdomain::{i}").as_str().into(),
                )
            })
            .collect::<Vec<_>>();
        (qdata, bytes)
    };

    // Go!
    let domain_ty = Type::resolve("%\"class.std::__cxx11::basic_string\"").unwrap();
    for n_label in 1..=MAX_LABEL {
        /*
           doamin: [l1: 1 byte] [..: l1 byte] [l2: 1byte] .. [0]
                   ^                          ^              ^
           offset: 0                          1+l1           k+(l1+..+lk)
           For k labels, there is k+1 offsets, and the length is at least 2k+1.
        */
        for mut offsets in (0..=(MAX_LEN - 2 - n_label)).combinations(n_label) {
            offsets.iter_mut().enumerate().for_each(|(i, ofs)| {
                *ofs += i + 2;
            });
            let length = offsets.last().unwrap() + 1;
            let length_desc = see
                .mstate_mut()
                .get_elem_ptr(domain_ty.clone(), &p_qdomain, 1)
                .unwrap();
            see.mstate_mut()
                .store(
                    &length_desc,
                    Exp::int_literal(length as i64, Some(64)).unwrap(),
                    true,
                )
                .unwrap();

            let mut last_ofs = 0;
            for ofs in offsets.into_iter() {
                let label_len = ofs - last_ofs - 1;
                let desc = see
                    .mstate_mut()
                    .get_ptr(Type::mk_bitvec(8), &qdata_desc, last_ofs as isize)
                    .unwrap();
                let exp = Exp::int_literal(label_len as i64, Some(8)).unwrap();
                see.mstate_mut().store(&desc, exp, true).unwrap();
                for i in last_ofs + 1..ofs {
                    let desc = see
                        .mstate_mut()
                        .get_ptr(Type::mk_bitvec(8), &qdata_desc, i as isize)
                        .unwrap();
                    let exp = qdata_bytes[i].clone();
                    see.mstate_mut().store(&desc, exp, true).unwrap();
                }
                last_ofs = ofs;
            }
            let desc = see
                .mstate_mut()
                .get_ptr(Type::mk_bitvec(8), &qdata_desc, last_ofs as isize)
                .unwrap();
            let exp = Exp::int_literal(0, Some(8)).unwrap();
            see.mstate_mut().store(&desc, exp, true).unwrap();

            assert!(see.summarize(
                "verify_pdns".into(),
                &vec![handler.clone(), info_exp.clone(), packet.clone()]
            ));
        }
    }

    // Dump the summary
    let summary = see.sman().summary("verify_pdns");
    // let summary = see.sman().summary("@_ZN13PacketHandler10doQuestionER9DNSPacket");
    outfile
        // .write_all(summary.to_string().as_bytes())
        .write_all(format!("{}", summary).as_bytes())
        .expect("failed to write summary");

    let elapsed = start.elapsed();
    println!("[test-pdns] {test_suite}::{test_id} done ({:?})", elapsed);
    Ok(())
}

const TYPE: &'static str = "__type__";
const SIZE: &'static str = "__size__";
const ZEROVAL: &'static [u8] = &[b'(', b'n', b'i', b'l', b')'];

/// Using the JSON file `json_file_name` as description, setup `Exp`s in the
/// execution engine `see`.
///
/// The JSON file is interpreted as a direct description of `MemoryRegion`s, with
/// all flattened fields listed in order (the offset being the JSON key).
/// The JSON values, then, are either `Type::BitVec` or `Type::Pointer`, where
/// * A `Type::BitVec` is spelled out as [ <value> <byte width> ] (JSON array)
/// * A `Type::Pointer` can be:
///     - "(nil)" for an `Exp::Null`
///     - "@<func_name>" for an `Exp::Ident` (function reference)
///     - "0x..." for an `Exp::IntLiteral` casted as `Type::Pointer`
///     - [ <region_key>, <offset> ] for an `Exp::GetPtr`, where <region_key> is either
///       a global identifier or a JSON key, and <offset> serves as the offset from the
///       start of that region.
///
/// Returns all the region memory descriptors that has a type annotation ("__type__").
fn setup(see: &mut See, json_file_name: &str) -> Vec<(String, MemoryDesc)> {
    let mut file_path = std::env::current_dir().expect("failed to get current directory");
    file_path.push("test/pdns/json");
    file_path.push(json_file_name);
    let mut file = std::fs::OpenOptions::new()
        .read(true)
        .open(file_path)
        .expect("cannot open json file");
    let mut json = String::new();
    file.read_to_string(&mut json)
        .expect("cannot read from file");
    let regions: Value = serde_json::from_str(&json).unwrap();

    // Collect all region memory descriptors..
    let mut descs = HashMap::new();
    let mut ret = Vec::new();
    for (key, region) in regions.as_object().unwrap() {
        if region.get(SIZE).unwrap().as_u64().unwrap() == 0 {
            // Zero-sized region
            continue;
        }

        let (ty, _) = __type_of(see, region);
        let desc = if key.starts_with('@') {
            // Global regions
            see.mstate()
                .get_global(key.as_str(), false)
                .or_else(|| see.mstate().get_global(key.as_str(), true))
                .unwrap_or_else(|| {
                    let exp = Exp::havoc(ty);
                    see.mstate_mut()
                        .alloc_global(exp, key.as_str().into(), false)
                        .unwrap()
                })
        } else {
            // Regions to be allocted
            let constant = match region.get(TYPE).map(|obj| obj.as_str().unwrap()) {
                Some("%class.BB2DomainInfo")
                | Some("%struct.Bind2DNSRecordExt")
                | Some("%\"class.boost::multi_index::multi_index_container.20\"") => true,
                _ => false,
            };
            see.alloc_global(Exp::havoc(ty), key.as_str().into(), constant)
                .unwrap()
        };
        descs.insert(key.clone(), desc.clone());
        if let Some(type_name) = region.get(TYPE) {
            let type_name = type_name.as_str().unwrap();
            ret.push((type_name.to_string(), desc));
        }
    }

    // ..then set up the actual values
    for (key, region) in regions.as_object().unwrap() {
        let Some(desc) = descs.get(key).cloned() else {
            // Zero-sized region
            continue;
        };

        let (ty, is_backend) = __type_of(see, region);
        let Some(obj) = region.as_object() else {
            unreachable!()
        };
        for (ofs, exp) in obj {
            if ofs == SIZE || ofs == TYPE {
                break;
            }
            let ofs = ofs.parse::<u32>().unwrap();
            let exp = match exp {
                Value::Array(arr) => {
                    let [ref e1, ref e2] = arr.as_slice() else {
                        unreachable!()
                    };
                    if e1.is_number() {
                        // BitVec
                        let value = e1.as_i64().unwrap();
                        let width = e2.as_u64().unwrap() as u32;
                        Exp::int_literal(value, Some(width * 8)).unwrap()
                    } else {
                        // Pointer
                        let offset = e2.as_u64().unwrap() as isize;
                        let base = e1.as_str().unwrap();
                        let desc = descs.get(base).cloned().or_else(|| {
                            if base.starts_with('@') {
                                Some(
                                    see.mstate()
                                        .get_global(base, false)
                                        .or_else(|| see.mstate().get_global(base, true))
                                        .unwrap_or_else(|| {
                                            see.mstate_mut()
                                                .alloc_global(
                                                    Exp::havoc(ty.clone()),
                                                    base.into(),
                                                    true,
                                                )
                                                .unwrap()
                                        }),
                                )
                            } else {
                                None
                            }
                        });
                        if let Some(desc) = desc {
                            let desc = see
                                .mstate_mut()
                                .get_ptr(Type::mk_bitvec(8), &desc, offset)
                                .unwrap();
                            Exp::pointer_literal(desc)
                        } else {
                            let value = u64::from_str_radix(&base[2..], 16).unwrap();
                            let exp =
                                Exp::int_literal(value as i64, Some(TYPE_POINTER_WIDTH)).unwrap();
                            Exp::bitcast(Type::mk_pointer(), exp).unwrap()
                        }
                    }
                }
                Value::String(str) => match str.as_bytes() {
                    ZEROVAL => Exp::null(),
                    [b'@', ..] => Exp::ident(Type::mk_pointer(), str.as_str().into()),
                    [b'0', b'x', ..] => {
                        if is_backend {
                            let vtable = see.mstate()
                                .get_global("@_ZTV12Bind2Backend", false)
                                .or_else(|| see.mstate().get_global("@_ZTV12Bind2Backend", true))
                                .unwrap();
                            let desc = see
                                .mstate_mut()
                                .get_ptr(Type::mk_pointer(), &vtable, 2)
                                .unwrap();
                            Exp::pointer_literal(desc)
                        } else {
                            let value = u64::from_str_radix(&str.as_str()[2..], 16).unwrap();
                            let exp = Exp::int_literal(value as i64, Some(TYPE_POINTER_WIDTH)).unwrap();
                            Exp::bitcast(Type::mk_pointer(), exp).unwrap()
                        }
                    }
                    _ => unreachable!(),
                },
                _ => unreachable!(),
            };

            let desc = see
                .mstate_mut()
                .get_ptr(Type::mk_bitvec(8), &desc, ofs as isize)
                .unwrap();
            see.mstate_mut().store(&desc, exp, true).unwrap();
        }
    }
    ret
}

fn __type_of(see: &mut See, region: &Value) -> (Rc<Type>, bool) {
    let Some(obj) = region.as_object() else {
        unreachable!()
    };

    // Named type
    if let Some(type_name) = obj.get(TYPE) {
        let is_backend = type_name == "%class.Bind2Backend";
        let ty = Type::resolve(type_name.as_str().unwrap()).unwrap();
        let size = obj.get(SIZE).unwrap().as_u64().unwrap() as u32;
        let sz = ty.get_layout(see.mstate_mut()).unwrap().size;
        assert!(
            size % sz == 0,
            "type {type_name} has size {sz}, found {size}",
        );
        return (Type::mk_array((size / sz) as usize, ty), is_backend);
    }

    // Anonymous type
    let mut fields = Vec::new();
    for (ofs, exp) in obj {
        if ofs == SIZE {
            break;
        }

        let _ = ofs.parse::<u32>().unwrap();
        let ty = match exp {
            Value::Array(arr) => {
                let [ref e1, ref e2] = arr.as_slice() else {
                    unreachable!()
                };
                if e1.is_number() {
                    // BitVec
                    let width = e2.as_u64().unwrap() as u32;
                    Type::mk_bitvec(width * 8)
                } else {
                    // Pointer
                    Type::mk_pointer()
                }
            }
            Value::String(_) => Type::mk_pointer(),
            _ => unreachable!(),
        };
        fields.push(ty);
    }
    (Type::mk_tuple(fields), false)
}
