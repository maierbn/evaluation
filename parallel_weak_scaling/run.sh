#!/bin/bash -x
# weak scaling
date
module add shared openmpi

echo "OPENCMISS_REL_DIR=$OPENCMISS_REL_DIR, OPENCMISS_REL_DIR=$OPENCMISS_REL_DIR"

. /etc/profile.d/modules.sh
. ~/.bashrc

mpiexec -n 1 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 3 4 1 1
mpiexec -n 2 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 3 4 2 1
mpiexec -n 4 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 3 8 2 1
mpiexec -n 8 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 6 8 2 1
mpiexec -n 12 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 6 8 3 1
mpiexec -n 16 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 6 8 4 1
mpiexec -n 24 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 6 12 4 1
mpiexec -n 32 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 6 16 4 1
mpiexec -n 64 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 12 16 4 1
mpiexec -n 96 $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 12 16 6 1
exit

xstart=3
ystart=4
zstart=1

for factor in {0..8}; do
  x=$(python -c "a=${xstart}*(1.2**${factor}); print a")
  y=$(python -c "a=${ystart}*(1.2**${factor}); print a")
  z=$(python -c "a=${zstart}*(1.2**${factor}); print a")

  nproc=$(python -c "t=${x}*${y}*${z}; t0=${xstart}*${ystart}*${zstart}; nproc = float(t)/t0; print nproc")

  x=$(python -c "print '{:d}'.format(int(round(${x})))")
  y=$(python -c "print '{:d}'.format(int(round(${y})))")
  z=$(python -c "print '{:d}'.format(int(round(${z})))")
  nproc=$(python -c "print '{:d}'.format(int(round(${nproc})))")

  echo "x=$x, y=$y, z=$z, nproc=$nproc"
  mpiexec -n $nproc $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR $x $y $z 1
done
