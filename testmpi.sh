#!/bin/bash -x
# das Script startet einen job in 64 Slots auf 4 Knoten von leadx02 - leadx07
date
sleep 2
date
#echo sge-var
#cat $PE_HOSTFILE
#echo sge-var end
. /etc/profile.d/modules.sh
sleep 2
module avail
sleep 2
echo add shared openmpi examples
module add shared openmpi examples
sleep 2
echo run mpi
mpiexec /opt/apps/examples/bin/testopenmpi
date
