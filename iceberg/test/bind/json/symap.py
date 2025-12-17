# import sys
# import json
# from elftools.elf.elffile import ELFFile

# def read_symtab(file_name):
#     with open(file_name, 'rb') as f:
#         elffile = ELFFile(f)

#         # Get the symbol table
#         symtab = elffile.get_section_by_name('.symtab')
#         if symtab is None:
#             print("No .symtab section found.")
#             return

#         func_symbols = {}
#         object_symbols = {}
#         for symbol in symtab.iter_symbols():
#             if symbol.entry['st_info'].type == 'STT_FUNC':
#                 func_symbols[hex(symbol['st_value'])] = symbol.name
#             elif symbol.entry['st_info'].type == 'STT_OBJECT':
#                 object_symbols[hex(symbol['st_value'])] = (symbol.name, symbol['st_size'])

#     with open("func.json", "w") as f:
#         json.dump(func_symbols, f, indent=4)
    
#     with open("object.json", "w") as f:
#         json.dump(object_symbols, f, indent=4)


# if __name__ == "__main__":
#     if len(sys.argv) < 2:
#         print("Please provide a file name as a command line argument.")
#         sys.exit(1)
#     file_name = sys.argv[1]
#     read_symtab(file_name)
