#!/bin/sh
cd diagrams
rm *.1
rm *.log
for file in *.mp
do
  mpost "${file}"
done
cd ..
