use crate::verify::*;
use itertools::*;
use serde_json::Value;
use std::collections::HashMap;
use std::io::{Read, Write};

pub const IR_FILE: &'static str = "test/hickory-dns/hickory-dns.oz.verify.ll";
pub const CONFIG_FILE: &'static str = "test/hickory-dns/config.toml";
const MAX_LABEL: usize = 4;
const MAX_LEN: usize = 2 * MAX_LABEL;

pub(super) fn verify(see: &mut See, test_suite: &str, test_id: &str) -> Panicable<()> {
    let start = std::time::Instant::now();
    let mut outfile = get_summary_outfile(
        "hickory-dns",
        format!("verify/{test_suite}/{test_id}.sum").as_str(),
    );
    
    let (descs, info_ptr) = setup(see, format!("{test_suite}/{test_id}/ctx.json").as_str());
    assert!(info_ptr.len() == 2);

    let records = "RECORDS";
    let records_map = descs
        .iter()
        .filter(|(type_name, _)| type_name.starts_with("Record"))
        .enumerate()
        .map(|(i, (_, record))| (i.to_string(), Exp::pointer_literal(record.clone())))
        .collect();
    see.vstate_mut()
        .put_abstract_map(records.to_string(), records_map);

    let tracing_level = see.mstate()
        .get_global("@_ZN12tracing_core8metadata9MAX_LEVEL17h74ff997bb9a121ceE", false)
        .or_else(|| see.mstate().get_global("@_ZN12tracing_core8metadata9MAX_LEVEL17h74ff997bb9a121ceE", true))
        .unwrap();
    see.mstate_mut().store(&tracing_level, Exp::int_literal(6, Some(64)).unwrap(), true).unwrap();

    let vtable = {
        let vtable = see.mstate()
            .get_global("@vtable.g", false)
            .or_else(|| see.mstate().get_global("@vtable.g", true))
            .unwrap();
        Exp::pointer_literal(vtable)
    };

    let additional_vtable = {
        let additional_vtable = see.mstate()
            .get_global("@vtable.1j", false)
            .or_else(|| see.mstate().get_global("@vtable.1j", true))
            .unwrap();
        Exp::pointer_literal(additional_vtable)
    };

    let authority = {
        let (_, authority) = descs
            .iter()
            .find(|(type_name, _)| type_name == "%\"alloc::sync::ArcInner<hickory_server::store::file::authority::FileAuthority>\"")
            .unwrap();
        let authority = Exp::pointer_literal(authority.clone());
        let dyn_authority = see.alloc_global(authority, "%dyn_authority".into(), true).unwrap();
        Exp::pointer_literal(dyn_authority)
    };

    let request_info = {
        let (_, request_info) = descs
            .iter()
            .rev()
            .find(|(type_name, _)| type_name == "RequestInfo")
            .unwrap();
        Exp::pointer_literal(request_info.clone())
    };
    
    let (request, name_desc, data_desc, ends_desc, bytes) = {
        let (_, request) = descs
            .iter()
            .rev()
            .find(|(type_name, _)| type_name == "Request")
            .unwrap();
        let qtype_desc = see
            .mstate_mut()
            .get_ptr(Type::mk_bitvec(8), request, 200)
            .unwrap();
        let qtype = make_symbolic(see, Type::mk_bitvec(16), "Verify::qtype".into());
        see.mstate_mut().store(&qtype_desc, qtype, true).unwrap();

        let name_desc = see
            .mstate_mut()
            .get_ptr(Type::mk_bitvec(8), request, 208)
            .unwrap();
        let data = see.alloc_global(Exp::havoc(typ!([i8; MAX_LEN])), "Verify::qdata".into(), false).unwrap();
        let ends = see.alloc_global(Exp::havoc(typ!([i8; MAX_LABEL])), "Verify::qends".into(), false).unwrap();

        see.mstate_mut()
            .store(&name_desc, Exp::int_literal(MAX_LEN as i64, Some(64)).unwrap(), true)
            .unwrap();
        let data_ptr_desc = see
            .mstate_mut()
            .get_ptr(Type::mk_bitvec(8), &name_desc, 8)
            .unwrap();
        see.mstate_mut()
            .store(&data_ptr_desc, Exp::pointer_literal(data.clone()), true)
            .unwrap();

        let label_ends_cap_desc = see
            .mstate_mut()
            .get_ptr(Type::mk_bitvec(8), &name_desc, 24)
            .unwrap();
        see.mstate_mut()
            .store(&label_ends_cap_desc, Exp::int_literal(MAX_LABEL as i64, Some(64)).unwrap(), true)
            .unwrap();

        let ends_ptr_desc = see
            .mstate_mut()
            .get_ptr(Type::mk_bitvec(8), &name_desc, 32)
            .unwrap();
        see.mstate_mut()
            .store(&ends_ptr_desc, Exp::pointer_literal(ends.clone()), true)
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

        (Exp::pointer_literal(request.clone()), name_desc, data, ends, bytes)
    };

    for n_label in 1..=MAX_LABEL {
        for label_ends in (1..=(MAX_LEN - n_label)).combinations(n_label) {
            // println!("label_ends={:?}", label_ends);
            let length = label_ends.last().cloned().unwrap();

            let data_len_desc = see
                .mstate_mut()
                .get_ptr(Type::mk_bitvec(8), &name_desc, 16)
                .unwrap();
            see.mstate_mut()
                .store(&data_len_desc, Exp::int_literal(length as i64, Some(64)).unwrap(), true)
                .unwrap();

            let ends_len_desc = see
                .mstate_mut()
                .get_ptr(Type::mk_bitvec(8), &name_desc, 40)
                .unwrap();
            see.mstate_mut()
                .store(&ends_len_desc, Exp::int_literal(n_label as i64, Some(64)).unwrap(), true)
                .unwrap();
        
            for (i, end) in label_ends.iter().enumerate() {
                let desc = see
                    .mstate_mut()
                    .get_ptr(Type::mk_bitvec(8), &ends_desc, i as isize)
                    .unwrap();
                let exp = Exp::int_literal(*end as i64, Some(8)).unwrap();
                see.mstate_mut().store(&desc, exp, true).unwrap();
            }

            for i in 0..length {
                let desc = see
                    .mstate_mut()
                    .get_ptr(Type::mk_bitvec(8), &data_desc, i as isize)
                    .unwrap();
                see.mstate_mut().store(&desc, bytes[i].clone(), true).unwrap();
            }

            assert!(see.summarize(
                "verify_hickory_dns".into(),
                &vec![request_info.clone(), authority.clone(), vtable.clone(), request.clone(), additional_vtable.clone()]
            ));

        }
    }
    
    let summary = see.sman().summary("verify_hickory_dns");
    outfile
        .write_all(format!("{:?}", summary).as_bytes())
        .expect("failed to write summary");

    let elapsed = start.elapsed();
    println!("[test-hdns] {test_suite}::{test_id} done ({:?})", elapsed);
    
    Ok(())
}

const TYPE: &'static str = "__type__";
const SIZE: &'static str = "__size__";
const LEN: &'static str = "__length__";
const DATA: &'static str = "data";
const BASE: &'static str = "base";

fn setup(see: &mut See, json_file_name: &str) -> (Vec<(String, MemoryDesc)>, Vec<MemoryDesc>) {
    let mut file_path = std::env::current_dir().expect("failed to get current directory");
    file_path.push("test/hickory-dns/json");
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
    let mut base_offset = HashMap::new();
    let mut ret = Vec::new();
    let mut request_info = Vec::new();
    for (key, region) in regions.as_object().unwrap() {
        if key.as_str() == "%request_info" { // Set offset manually
            let obj = region.as_object().unwrap();
            let base = obj.get(BASE).unwrap().as_str().unwrap().to_string();
            let base_ptr = match base.as_bytes() {
                [b'0', b'x', ..] => u64::from_str_radix(&base.as_str()[2..], 16).unwrap(),
                _ => unreachable!(),
            };

            let data = obj.get(DATA).unwrap().as_array().unwrap();
            for ptr in data {
                let ptr = ptr.as_str().unwrap();
                let ptr = match ptr.as_bytes() {
                    [b'0', b'x', ..] => u64::from_str_radix(&ptr[2..], 16).unwrap(),
                    _ => unreachable!(),
                };
                base_offset.insert(ptr, (base.clone(), ptr - base_ptr));
            }
        } else {
            let (ty, is_constant) = __type_of(see, region);

            let type_name = region.get(TYPE).unwrap().as_str().unwrap();
            let is_request = type_name == "Request";

            let desc = if is_constant {
                see.alloc_global(Exp::havoc(ty), key.as_str().into(), !is_request).unwrap()
                // see.alloc_heap(ty, false).unwrap()
            } else {
                see.alloc_global_unwritable(Exp::havoc(ty), key.as_str().into()).unwrap()
            };
            descs.insert(key.clone(), desc.clone());

            let ptr = match key.as_bytes() {
                [b'0', b'x', ..] => u64::from_str_radix(&key[2..], 16).unwrap(),
                _ => unreachable!(),
            };
            base_offset.insert(ptr, (key.clone(), 0));

            ret.push((type_name.to_string(), desc));
        }
    }

    // ..then set up the actual values
    for (key, region) in regions.as_object().unwrap() {
        let Some(desc) = descs.get(key).cloned() else {
            continue;
        };

        let (ty, _) = __type_of(see, region);
        let Some(obj) = region.as_object() else {
            unreachable!()
        };

        let data = obj.get(DATA).unwrap().as_array().unwrap();
        let layout = ty.get_layout(see.mstate_mut()).unwrap();
        assert!(data.len() == layout.size as usize);

        for (ofs, size) in layout.flattened.iter() {
            let begin = *ofs as usize;
            let end = (ofs + size) as usize;
            let bitvec: Vec<u8> = data[begin..end]
                .iter()
                .map(|n| n.as_u64().unwrap().try_into().unwrap())
                .collect();
            let exp = match size {
                1 => Exp::int_literal(
                    i8::from_le_bytes(bitvec.try_into().unwrap()) as i64,
                    Some(size * 8)
                ).unwrap(),
                2 => Exp::int_literal(
                    i16::from_le_bytes(bitvec.try_into().unwrap()) as i64,
                    Some(size * 8)
                ).unwrap(),
                4 => Exp::int_literal(
                    i32::from_le_bytes(bitvec.try_into().unwrap()) as i64,
                    Some(size * 8)
                ).unwrap(),
                8 => {
                    let value = i64::from_le_bytes(bitvec.try_into().unwrap());
                    if let Some((base, offset)) = base_offset.get(&(value as u64)) {
                        if let Some(base) = descs.get(base) {
                            let ptr_to_desc = see
                                .mstate_mut()
                                .get_ptr(Type::mk_bitvec(8), base, *offset as isize)
                                .unwrap();
                            if *offset > 0 {
                                request_info.push(ptr_to_desc.clone());
                            }
                            Exp::pointer_literal(ptr_to_desc)
                        } else {
                            let exp = Exp::int_literal(value, Some(TYPE_POINTER_WIDTH)).unwrap();
                            Exp::bitcast(Type::mk_pointer(), exp).unwrap()
                        }
                    } else {
                        Exp::int_literal(value, Some(size * 8)).unwrap()
                    }
                },
                _ => unreachable!()
            };

            let desc = see
                .mstate_mut()
                .get_ptr(Type::mk_bitvec(8), &desc, *ofs as isize)
                .unwrap();
            see.mstate_mut().store(&desc, exp, true).unwrap();
        }
    }

    (ret, request_info)
}

fn __type_of(see: &mut See, region: &Value) -> (Rc<Type>, bool) {
    let Some(obj) = region.as_object() else {
        unreachable!()
    };

    // Named type
    let type_name = obj.get(TYPE).unwrap().as_str().unwrap();
    let len = obj.get(LEN).map_or(1, |l| l.as_u64().unwrap() as usize);

    let is_constant = 
        type_name != "%\"alloc::sync::ArcInner<hickory_server::store::file::authority::FileAuthority>\""
        && type_name != "%\"alloc::sync::ArcInner<hickory_proto::rr::rr_set::RecordSet>\"";
    
    let ty = match type_name {
        "i8" => Type::mk_bitvec(8),
        "i16" => Type::mk_bitvec(16),
        "i32" => Type::mk_bitvec(32),
        "i64" => Type::mk_bitvec(64),
        "ptr" => Type::mk_pointer(),
        _ => Type::resolve(type_name).unwrap(),
    };
    let size = obj.get(SIZE).unwrap().as_u64().unwrap() as u32;
    let sz = ty.get_layout(see.mstate_mut()).unwrap().size;
    assert!(
        size == sz,
        "type {type_name} has size {sz}, found {size}",
    );

    (Type::mk_array(len, ty), is_constant)
}
