import argparse
import glob
import os
import subprocess
import sys
import pprint
# indir = "dir_n00e060"
# file_list = glob.glob(indir + r"\*.tif")
# files_string = " ".join(file_list)
# print(file_list)


def merge_tiff(files, outfile, run=True):
    """
    merge tiff files by gdal_merge.py
    """
    files_string = " ".join(files)
    command = "gdal_merge.py -o " + outfile + \
        " -of gtiff -co COMPRESS=LZW " + files_string
    print(command)
    if run:
        os.system(command)


# Construct the argument parser
ap = argparse.ArgumentParser()
# Add the arguments to the parser
ap.add_argument("-i", "--indir", default=".",
                help="input directory of tiff files")
ap.add_argument("-p", "--pattern", default="*")
# ap.add_argument('--files', default=[], nargs='+')
args = vars(ap.parse_args())
# print(ap.parse_args())
# print(args)

# files = args["files"]
indir = args["indir"]
pattern = args["pattern"]

pathname = "%s/%s" % (indir, pattern)
files = glob.glob(pathname)
pprint.pprint(files)

# if len(sys.argv) == 1:
#     exit
# else:
#     # https://stackoverflow.com/questions/15753701/how-can-i-pass-a-list-as-a-command-line-argument-with-argparse
#     # files = args["files"]
    # if len(files) == 0:
    #     print(files)
