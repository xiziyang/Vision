#!/bin/bash

if [ ! -d "PBS" ]; then
    mkdir PBS;
fi
name=${PWD##*/}
source=PBS.pbs
cat $source | sed "s/jobname/$name-${1}-${2}-${3}/" | sed "s/par1/${1}/" | sed "s/par2/${2}/" | sed "s/par3/${3}/" > PBS/$name-${1}-${2}-${3}.pbs
qsub -o /scratch/arnfred/results/ PBS/$name-${1}-${2}-${3}.pbs
# for i in   256
# do
#   for j in awgn 
#   do
#       echo BER-$SimCampName-$i-$j
#   done
# donee
