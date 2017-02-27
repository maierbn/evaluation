#!/bin/bash
# das Script startet einen job in 64 Slots auf 4 Knoten von Leadx02 - Leadx07
date
sleep 5
echo "PE_HOSTFILE (${PE_HOSTFILE}):"
cat $PE_HOSTFILE
echo "PE_HOSTFILE end"
. /etc/profile.d/modules.sh
sleep 2
echo "modules:"
module avail
sleep 2
echo "add shared openmpi examples"
module add shared openmpi examples
sleep 2
echo "run mpi"
mpirun -n 4 /opt/apps/examples/bin/testopenmpi
date
# end of script file
