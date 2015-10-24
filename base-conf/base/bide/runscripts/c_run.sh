#! /bin/bash

fullname="$1"
name="${fullname%.*}"
outname="${name}.out"
gcc $fullname -o $outname
./$outname "${@:2}"
rm $outname
