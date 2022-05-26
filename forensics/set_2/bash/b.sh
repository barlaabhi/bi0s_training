#!/bin/bash

n=7


for i in $(seq 1 $n)
do
	k=$(($n-$i))
	for j in $(seq 1 $k)
	do
		echo -n " "
	done

	k=$((($i*2)-1))
	for j in $(seq 1 $k)
	do
		echo -n "#"
	done
	echo 
done

