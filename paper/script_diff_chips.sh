#!/bin/bash
cd ${PBS_O_WORKDIR}
FILES=../../../benchmarks_plingeling/*

for f in $FILES
do
	for i in `seq 1 10`; 
	do
  		taskset -c 0-9 ../lingeling-modificado/plingeling $f -t $i -v
	done
done

