#!python
""" Scipy variant of Cython command

Cython, as applied to single pyx file.
Expects two arguments, infile and outfile.
Other options passed through to cython command line parser.
"""

import os
import os.path as op
import subprocess as sbp
import sys


def main():
    in_fname, out_fname = (op.abspath(p) for p in sys.argv[1:3])

    print("inside cythoner: ")
    print("input file: ", in_fname)
    print("output file: ", out_fname)

    sbp.run(
        [
            "cython",
            "-3",
            "--fast-fail",
            "--output-file",
            out_fname,
            "--include-dir",
            os.getcwd(),
        ]
        + sys.argv[3:]
        + [in_fname],
        check=True,
    )


if __name__ == "__main__":
    main()
