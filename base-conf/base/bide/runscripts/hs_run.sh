#! /bin/bash
file=$1
name="${file%.*}"
ghc $file
./$name "${@:2}"
rm $name *.hi *.o
