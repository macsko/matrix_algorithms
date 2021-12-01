from sys import argv

# (script name) matrix_type nxx pxx
if len(argv) != 4:
    raise RuntimeError(f"Invalid number of arguments passed to script {len(argv)}. Required 3!")

matrix_type = argv[1]
nxx = int(argv[2])
pxx = int(argv[3])

if matrix_type == "iga":
    print((nxx + pxx) * (nxx + pxx), end='')
elif matrix_type == "fem":
    print((2 * nxx + pxx - 1) ** 2, end='')
else:
    print('unknown')
