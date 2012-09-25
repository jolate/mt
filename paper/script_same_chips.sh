#!/bin/bash
cd ${PBS_O_WORKDIR}
FILES=../../../benchmarks_plingeling/*

for f in $FILES
do
  echo "Processing $f file..."
	for i in `seq 1 4`; 
	do
  		taskset -c 0,1,2,3 ../lingeling-modificado/plingeling $f -t $i
	done
done

