#!/bin/bash

# error out on unset var or error in script
set -u
set -e

BASEDIR=$(dirname $0)
OUTFILE=boyer_occur_$1_$2.asm

cd ${BASEDIR}/..
cp boyer_occur.asm ${OUTFILE}
( for i in $(boyer_occur/boyergen.pl $1 $2 2>> ${OUTFILE} | boyer_occur/exo0); do
    echo "tape 1, $i"
done) >> ${OUTFILE}
