#!/bin/bash 
# weak scaling
date
module add shared openmpi

echo "OPENCMISS_REL_DIR=$OPENCMISS_REL_DIR, OPENCMISS_REL_DIR=$OPENCMISS_REL_DIR"

. /etc/profile.d/modules.sh
. ~/.bashrc

function check_exit()
{
   while true; do
      HOUR=$(date +%H)
      echo "Current time: $(date)"

      if [ $HOUR -ge 7 ] && [ $HOUR -le 20 ] ; then    # wait if 7 <= hour <= 20
         echo "Don't run program because it is between 7 and 20."
         sleep 1h
      else
         echo "OK"
         break
      fi
   done
}

echo "weak scaling"

#while true; do
  check_exit
  mpiexec -n 1 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 3 8 1 1
  check_exit
  mpiexec -n 2 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 3 8 2 1
  check_exit
  mpiexec -n 4 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 3 16 2 1
  check_exit
  mpiexec -n 8 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 6 16 2 1
  check_exit
  mpiexec -n 12 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 6 16 3 1
  check_exit
  mpiexec -n 16 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 6 16 4 1
  check_exit
  mpiexec -n 24 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 6 24 4 1
  check_exit
  mpiexec -n 32 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 6 32 4 1
  check_exit
  mpiexec -n 64 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 12 32 4 1
  check_exit
  mpiexec -n 96 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 12 32 6 1
  check_exit
#done
