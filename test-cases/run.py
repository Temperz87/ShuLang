import os
import sys

# TODO: Cleanup
# I kind of just through this file together

if __name__ == '__main__':
    folder = sys.argv[1]
    files = sorted(os.listdir(folder))
    for file in files:
        fp = os.path.join(folder, file)
        print("Compiling", fp)
        retcode = os.system("../src/output/ShuC.out " + fp) // 256
        if retcode != 0:
            print("Error compiling", fp)
            exit(retcode)