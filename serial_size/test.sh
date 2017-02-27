#!/bin/bash -x
# das Script startet einen job in 64 Slots auf 4 Knoten von Leadx02 - Leadx07
##
#$ -q fast.q
## als Auffuellregel wird das fillup verwendet
#$ -pe mpi_ff 64
##
date
sleep 5
echo "ulimit"
ulimit
echo "PE_HOSTFILE (${PE_HOSTFILE}):"
cat $PE_HOSTFILE
echo "PE_HOSTFILE end"
. /etc/profile.d/modules.sh
sleep 2
echo "modules:"
module avail
sleep 2
module load openmpi/64/1.5.4 
echo "add shared openmpi examples"
module add shared openmpi examples
sleep 2
echo "run mpi"
mpirun -n 4 /opt/apps/examples/bin/testopenmpi
date
# end of script file
