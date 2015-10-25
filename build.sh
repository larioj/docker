#!/bin/bash
for name in $@; do
  cd $name && docker build -t $name . && cd .. ;
done
