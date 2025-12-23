import sys
import json
import re

def resolve_duplicates(ordered_pairs):
    d = {}
    for k, v in ordered_pairs:
        # Keep the largest region
        if k not in d or d[k]["__size__"] < v["__size__"]:
            d[k] = v
        # else:
        #     assert False, "Duplicate keys found"
    return d

def resolve_aliases(regions):
    def get_size(obj):
        if isinstance(obj, dict):
            return obj["__size__"]
        else:
            raise f"standalone object {obj}"
        
    prepared_regions = [(int(key, 16), get_size(value), key) for key, value in regions.items()]

    prepared_regions.sort(key=lambda x: (x[0], -x[1]))

    filtered_regions = {}
    last_end = -1  # Keep track of the end of the last added region

    for start, size, original_key in prepared_regions:
        end = start + size
        if start >= last_end:  # If this region starts after the last one ends, it doesn't overlap
            filtered_regions[original_key] = regions[original_key]
            last_end = end

    return filtered_regions

def resolve_global(data: dict):
    # Check the regions against the function and objects map
    # to resolve global references
    with open("func.json") as f:
        funcs = json.load(f)
    with open("object.json") as f:
        objects = json.load(f)
    
    def sizeof(v):
        if isinstance(v, dict):
            return v["__size__"]
        else:
            return 0
        
    regions = [(int(k, 16), sizeof(data[k])) for k in data]
    regions.sort()
    def find_region(addr):
        i = 0
        while i < len(regions) and \
            ((regions[i][1] > 0 and regions[i][0]+regions[i][1] <= addr) \
            or (regions[i][1] == 0 and regions[i][0] < addr)):
            i += 1
        if i == len(regions):
            if regions[i-1][0]+regions[i-1][1] == addr:
                return i-1
            return -1
        if regions[i][0] <= addr:
            return i
        else:
            if i > 0 and regions[i-1][0]+regions[i-1][1] == addr:
                return i-1
            return -1
        
    def resolve(item, key=False):
        if isinstance(item, dict):
            return {resolve(k, key=True): resolve(v) for k, v in item.items() if ':' not in k}
        elif isinstance(item, list):
            return item
        elif isinstance(item, str):         
            if item.startswith("0x"):

                if key:
                    if item in objects:
                        obj = "@" + objects[item][0]
                        print(f"[info] resolve {item} to {obj}")
                        return obj
                    else:
                        return item
                
                if item in funcs:
                    func = "@" + funcs[item]
                    print(f"[info] resolve {item} to {func}")
                    return func
                    
                addr = int(item, 16)
                i = find_region(addr)
                if i == -1:
                    for start, region in objects.items():
                        start = int(start, 16)
                        size = region[1]
                        if addr >= start and addr < start + size:
                            obj = "@" + region[0]
                            print(f"[info] resolve {item} to {obj}")
                            return [obj, addr-start]

                    if item != "0x1" and item != "0xffffffffffffffff":
                        print(f"[warning] unresolved object {item}")
                    return item
                else:
                    region, _ = regions[i]
                    if hex(region) in objects:
                        obj = "@" + objects[hex(region)][0]
                        print(f"[info] resolve {item} to {obj}")
                        return [obj, addr-region]
                    else:
                        return [hex(region), addr-region]
            else:
                return item
        else:
            return item
    
    return resolve(data)


def main(file_name):
    with open(file_name) as file:
        data = json.load(file, object_pairs_hook=resolve_duplicates)

    data = resolve_aliases(data)

    data = resolve_global(data)
    
    output_file_name = "ctx.json"
    with open(output_file_name, "w") as f:
        json.dump(data, f, separators=(',', ':'))

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Please provide a file name as a command line argument.")
        sys.exit(1)
    file_name = sys.argv[1]
    main(file_name)

