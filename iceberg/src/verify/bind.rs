//! Verifying CoreDNS.
//!
//! Contains code that parses CDNS memory dump, as well as
//! refinement proof steps.

use crate::verify::*;
use itertools::*;
use serde_json::Value;
use std::collections::HashMap;
#[allow(unused)]
use std::io::{Read, Write};

pub const IR_FILE: &'static str = "test/bind/bind.opt.oz.verify.ll";
pub const CONFIG_FILE: &'static str = "test/bind/config.toml";
const MAX_LABEL: usize = 4;
const MAX_LEN: usize = 2 * MAX_LABEL + 1;

pub(super) fn verify(see: &mut See, test_suite: &str, test_id: &str) -> Panicable<()> {
    let start = std::time::Instant::now();
    let mut outfile = get_summary_outfile(
        "bind",
        format!("verify/{test_suite}/{test_id}.sum").as_str(),
    );

    let descs = setup(see, format!("{test_suite}/{test_id}/ctx.json").as_str());

    let zt = "DNS_ZT";

    // client
    let client = {
        let (_, client) = descs
            .iter()
            .find(|(type_name, _)| type_name.eq("%struct.ns_client.6057"))
            .unwrap();
        Exp::pointer_literal(client.clone())
    };

    // message
    let message = {
        let (_, desc) = descs
            .iter()
            .find(|(type_name, _)| type_name.eq("%struct.dns_message"))
            .unwrap();
        Exp::pointer_literal(desc.clone())
    };

    // setup zt as an abstract map
    let mut map = HashMap::new();
    let mut tree = None;
    for (type_name, desc) in descs.iter() {
        if !type_name.eq("%struct.dns_zone") {
            continue;
        }

        let zone_ty = Type::resolve("%struct.dns_zone").unwrap();
        let dns_name_ty = Type::resolve("%struct.dns_name").unwrap();
        let rbtdb_ty = Type::resolve("%struct.dns_rbtdb").unwrap();

        let rclass = {
            let desc = see
                .mstate_mut()
                .get_elem_ptr(zone_ty.clone(), &desc, 24)
                .unwrap();
            exp_as_data!(
                see.mstate_mut()
                    .load(Type::mk_bitvec(16), &desc, None)
                    .unwrap(),
                Exp::IntLiteral
            )
            .value
        };
        let origin_len = {
            let desc = see
                .mstate_mut()
                .get_elem_ptr(zone_ty.clone(), &desc, 14)
                .unwrap();
            let desc = see
                .mstate_mut()
                .get_elem_ptr(dns_name_ty.clone(), &desc, 2)
                .unwrap();
            exp_as_data!(
                see.mstate_mut()
                    .load(Type::mk_bitvec(32), &desc, None)
                    .unwrap(),
                Exp::IntLiteral
            )
            .value
        };

        // ..only for IN zones, and not the root zone
        if rclass != 1 || origin_len <= 1 {
            continue;
        }
        map.insert(map.len().to_string(), Exp::pointer_literal(desc.clone()));
        let rbt = {
            let desc = see
                .mstate_mut()
                .get_elem_ptr(zone_ty.clone(), &desc, 7)
                .unwrap();
            let desc = exp_as_data!(
                see.mstate_mut()
                    .load(Type::mk_pointer(), &desc, None)
                    .unwrap(),
                Exp::PointerLiteral
            )
            .desc
            .clone();
            let desc = see
                .mstate_mut()
                .get_elem_ptr(rbtdb_ty.clone(), &desc, 28)
                .unwrap();
            see.mstate_mut()
                .load(Type::mk_pointer(), &desc, None)
                .unwrap()
        };
        _ = tree.insert(rbt);
    }
    {
        let client_ty = Type::resolve("%struct.ns_client.6057").unwrap();
        let view_ty = Type::resolve("%struct.dns_view").unwrap();
        let (_, desc) = descs
            .iter()
            .find(|(type_name, _)| type_name.eq("%struct.ns_client.6057"))
            .unwrap();
        let desc = see.mstate_mut().get_elem_ptr(client_ty, &desc, 5).unwrap();
        let desc = exp_as_data!(
            see.mstate_mut()
                .load(Type::mk_pointer(), &desc, None)
                .unwrap(),
            Exp::PointerLiteral
        )
        .desc
        .clone();
        let desc = see.mstate_mut().get_elem_ptr(view_ty, &desc, 4).unwrap();
        see.mstate_mut()
            .store(&desc, Exp::ident(Type::mk_pointer(), zt.into()), true)
            .unwrap();
    };
    see.vstate_mut().put_abstract_map(zt.to_string(), map);

    // Install a symbolic qtype
    let name_desc = {
        let message_ty = Type::resolve("%struct.dns_message").unwrap();
        let dns_name_ty = Type::resolve("%struct.dns_name").unwrap();
        let desc = exp_as_data!(message, Exp::PointerLiteral).desc.clone();
        let desc = see.mstate_mut().get_elem_ptr(message_ty, &desc, 8).unwrap();
        let name_desc = exp_as_data!(
            see.mstate_mut()
                .load(Type::mk_pointer(), &desc, None)
                .unwrap(),
            Exp::PointerLiteral
        )
        .desc
        .clone();
        // ^ this is the qname
        let desc = see
            .mstate_mut()
            .get_elem_ptr(dns_name_ty, &name_desc, 8)
            .unwrap();
        let desc = exp_as_data!(
            see.mstate_mut()
                .load(Type::mk_pointer(), &desc, None)
                .unwrap(),
            Exp::PointerLiteral
        )
        .desc
        .clone();
        let desc = see
            .mstate_mut()
            .get_ptr(Type::mk_bitvec(8), &desc, 34)
            .unwrap();
        // ^ this is rdataset->type
        let qtype = make_symbolic(see, Type::mk_bitvec(16), "Verify::qtype".into());
        see.mstate_mut().store(&desc, qtype, true).unwrap();
        name_desc
    };

    // Install a symbolic qname
    let (ndata_desc, ndata_bytes) = {
        let ty = typ!([i8; MAX_LEN]);
        let ndata = see.alloc_heap(ty, false).unwrap();
        let desc = see
            .mstate_mut()
            .get_elem_ptr(Type::resolve("%struct.dns_name").unwrap(), &name_desc, 1)
            .unwrap();
        see.mstate_mut()
            .store(&desc, Exp::pointer_literal(ndata.clone()), true)
            .unwrap();

        let bytes = (0..MAX_LEN)
            .map(|i| {
                make_symbolic(
                    see,
                    Type::mk_bitvec(8),
                    format!("Verify::qname::{i}").as_str().into(),
                )
            })
            .collect::<Vec<_>>();
        (ndata, bytes)
    };
    let offsets_desc = {
        let ty = typ!([i8; MAX_LABEL + 1]);
        let offsets = see.alloc_heap(ty, false).unwrap();
        let desc = see
            .mstate_mut()
            .get_elem_ptr(Type::resolve("%struct.dns_name").unwrap(), &name_desc, 5)
            .unwrap();
        see.mstate_mut()
            .store(&desc, Exp::pointer_literal(offsets.clone()), true)
            .unwrap();

        let zero = Exp::int_literal(0, Some(8)).unwrap();
        see.mstate_mut().store(&offsets, zero, true).unwrap(); // [0, .. ]
        offsets
    };

    // Go!
    let dns_name_ty = Type::resolve("%struct.dns_name").unwrap();
    for n_label in 1..=MAX_LABEL {
        /*
           ndata: [l1: 1 byte] [..: l1 byte] [l2: 1byte] .. [0]
                   ^                          ^              ^
           offset: 0                          1+l1           k+(l1+..+lk)
           For k labels, there is k+1 offsets, and the length is at least 2k+1.
        */
        for mut offsets in (0..=(MAX_LEN - 2 - n_label)).combinations(n_label) {
            offsets.iter_mut().enumerate().for_each(|(i, ofs)| {
                *ofs += i + 2;
            });
            let length = offsets.last().unwrap() + 1;
            // println!("offsets = {:?}, length = {}", offsets, length);

            let length_desc = see
                .mstate_mut()
                .get_elem_ptr(dns_name_ty.clone(), &name_desc, 2)
                .unwrap();
            see.mstate_mut()
                .store(
                    &length_desc,
                    Exp::int_literal(length as i64, Some(32)).unwrap(),
                    true,
                )
                .unwrap();
            let labels_desc = see
                .mstate_mut()
                .get_elem_ptr(dns_name_ty.clone(), &name_desc, 3)
                .unwrap();
            see.mstate_mut()
                .store(
                    &labels_desc,
                    Exp::int_literal((offsets.len() + 1) as i64, Some(32)).unwrap(),
                    true,
                )
                .unwrap();

            let mut last_ofs = 0;
            for (i, ofs) in offsets.into_iter().enumerate() {
                let desc = see
                    .mstate_mut()
                    .get_ptr(Type::mk_bitvec(8), &offsets_desc, i as isize + 1)
                    .unwrap();
                let exp = Exp::int_literal(ofs as i64, Some(8)).unwrap();
                see.mstate_mut().store(&desc, exp, true).unwrap();

                let label_len = ofs - last_ofs - 1;
                let desc = see
                    .mstate_mut()
                    .get_ptr(Type::mk_bitvec(8), &ndata_desc, last_ofs as isize)
                    .unwrap();
                let exp = Exp::int_literal(label_len as i64, Some(8)).unwrap();
                see.mstate_mut().store(&desc, exp, true).unwrap();
                for i in last_ofs + 1..ofs {
                    let desc = see
                        .mstate_mut()
                        .get_ptr(Type::mk_bitvec(8), &ndata_desc, i as isize)
                        .unwrap();
                    let exp = ndata_bytes[i].clone();
                    see.mstate_mut().store(&desc, exp, true).unwrap();
                }
                last_ofs = ofs;
            }
            let desc = see
                .mstate_mut()
                .get_ptr(Type::mk_bitvec(8), &ndata_desc, last_ofs as isize)
                .unwrap();
            let exp = Exp::int_literal(0, Some(8)).unwrap();
            see.mstate_mut().store(&desc, exp, true).unwrap();

            assert!(see.summarize(
                "verify_bind".into(),
                &vec![client.clone(), tree.clone().unwrap()]
            ));
        }
    }

    // Dump the summary
    let summary = see.sman().summary("verify_bind");
    outfile
        .write_all(format!("{:?}", summary).as_bytes())
        .expect("failed to write summary");

    let elapsed = start.elapsed();
    println!("[test-bind] {test_suite}::{test_id} done ({:?})", elapsed);
    Ok(())
}

const TYPE: &'static str = "__type__";
const SIZE: &'static str = "__size__";
const EXT: &'static str = "ext";
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
/// Finally, a region may end with an extension, which is an extra array of bytes.
/// This field, if present, has a JSON array as value, which ends with "ext".
///
/// Returns all the region memory descriptors that has a type annotation ("__type__").
fn setup(see: &mut See, json_file_name: &str) -> Vec<(String, MemoryDesc)> {
    let mut file_path = std::env::current_dir().expect("failed to get current directory");
    file_path.push("test/bind/json");
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

        let ty = __type_of(see, region);
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
            match region.get(TYPE).map(|obj| obj.as_str().unwrap()) {
                Some("%struct.dns_zone") => {
                    // `dns_zone`s are allocated as global regions, as
                    // they are put into the ZT abstract map
                    see.alloc_global(Exp::havoc(ty), key.as_str().into(), false)
                        .unwrap()
                }
                Some("%struct.dns_rbtnode") | Some("%struct.dns_slabheader") => {
                    // `dns_rbtnode`s, and `dns_slabheader`s are allocated as constant regions
                    // to simplify verification
                    see.alloc_global(Exp::havoc(ty), key.as_str().into(), true)
                        .unwrap()
                }
                _ => see.alloc_heap(ty, false).unwrap(),
            }
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

        let Some(obj) = region.as_object() else {
            unreachable!()
        };
        for (ofs, exp) in obj {
            if ofs == SIZE {
                break;
            }
            let ofs = ofs.parse::<u32>().unwrap();
            let exp = match exp {
                Value::Array(arr) => {
                    if arr.last().is_some_and(|e| e.is_string()) {
                        // Extension
                        let bytes: Vec<_> = arr
                            .split_last()
                            .unwrap()
                            .1
                            .iter()
                            .map(|e| Exp::int_literal(e.as_i64().unwrap(), Some(8)).unwrap())
                            .collect();
                        let ty = typ!([i8; bytes.len()]);
                        Exp::vector(ty, bytes).unwrap()
                    } else {
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
                                    Some(see.mstate().get_global(base, false).unwrap())
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
                                let exp = Exp::int_literal(value as i64, Some(TYPE_POINTER_WIDTH))
                                    .unwrap();
                                Exp::bitcast(Type::mk_pointer(), exp).unwrap()
                            }
                        }
                    }
                }
                Value::String(str) => match str.as_bytes() {
                    ZEROVAL => Exp::null(),
                    [b'@', ..] => Exp::ident(Type::mk_pointer(), str.as_str().into()),
                    [b'0', b'x', ..] => {
                        let value = u64::from_str_radix(&str.as_str()[2..], 16).unwrap();
                        let exp = Exp::int_literal(value as i64, Some(TYPE_POINTER_WIDTH)).unwrap();
                        Exp::bitcast(Type::mk_pointer(), exp).unwrap()
                    }
                    _ => unreachable!(),
                },
                _ => unreachable!(),
            };

            let desc = see
                .mstate_mut()
                .get_ptr(Type::mk_bitvec(8), &desc, ofs as isize)
                .unwrap();
            // println!("[{key}] ofs={ofs}, storing {exp}");
            see.mstate_mut().store(&desc, exp, true).unwrap();
        }
    }
    ret
}

fn __type_of(see: &mut See, region: &Value) -> Rc<Type> {
    let Some(obj) = region.as_object() else {
        unreachable!()
    };

    // Named type
    if let Some(type_name) = obj.get(TYPE) {
        let type_name = type_name.as_str().unwrap();
        let ty = Type::resolve(type_name).unwrap();
        let size = obj.get(SIZE).unwrap().as_u64().unwrap() as u32;
        // Check for extension
        let ext = obj
            .iter()
            .find(|(_, v)| {
                v.as_array().is_some_and(|arr| {
                    arr.last()
                        .is_some_and(|e| e.as_str().is_some_and(|str| str.eq(EXT)))
                })
            })
            .is_some();
        if ext {
            let extsize = size - ty.get_layout(see.mstate_mut()).unwrap().size;
            return Type::mk_tuple([ty, typ!([i8; extsize as usize])]);
        } else {
            let sz = ty.get_layout(see.mstate_mut()).unwrap().size;
            assert!(
                size % sz == 0,
                "type {type_name} has size {sz}, found {size}",
            );
            return Type::mk_array((size / sz) as usize, ty);
        }
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
    Type::mk_tuple(fields)
}
