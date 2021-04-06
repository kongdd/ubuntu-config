import argparse
import glob
import os
import subprocess
import sys
import pprint


def merge_tiff(files, outfile, run=True, verbose=True):
    """
    merge tiff files by gdal_merge.py
    space is not allowed in the filepath
    """
    files_string = " ".join(files)
    # gdalbuildvrt.exe
    command = "gdalbuildvrt.exe " + outfile + " " + files_string
    if verbose:
        print(command)
    if run:
        os.system(command)


ap = argparse.ArgumentParser()
ap.add_argument("-i", "--pathname", default=".",
                help="pathname for glob searching")
ap.add_argument("-o", "--outfile", default="merged.tif",
                help="output filename of the merged tiff")
ap.add_argument('--files', default=[], nargs='+')
ap.add_argument("--run", default=False, action="store_true",
                help="run script")

if len(sys.argv) == 1:
    ap.print_help()
    print("## example:")
    print("merge_tiff.py -i ./hnd*.tif -o hnd_n0060-e060150.tif --run")
else:
    # 
    # https://stackoverflow.com/questions/15753701/how-can-i-pass-a-list-as-a-command-line-argument-with-argparse
    args = vars(ap.parse_args())
    # print(ap.parse_args())
    print(args)
    files = args["files"]
    indir = args["pathname"]  # glob pathname
    outfile = args["outfile"]
    run = args["run"]
    
    if len(files) == 0:
        files = glob.glob(indir)
    print("Input files --------------------------------")
    pprint.pprint(files)
    # print(files, outfile)
    merge_tiff(files, outfile, run)

# if __name__ == "__main__":
#     print("hello")
# indir = "dir_n00e060"
# file_list = glob.glob(indir + r"\*.tif")
# files_string = " ".join(file_list)
# print(file_list)
