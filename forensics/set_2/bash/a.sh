#!/bin/bash
n=5

for ((i=1; i<$(($n+1)); i+=1))
do
	k=$((n-$i))
	for j in $(seq 1 $k)
	do
		echo -n " "
	done

	for j in $(seq 1 $i)
	do
		echo -n "#"
	done
	echo 
	
done

