#!/bin/bash 
# weak scaling

export SCENARIO=parallel_weak_scaling

# function queues run_with_parameters.sh and blocks until it is finished
function execute_blocking {
  command="$OPENCMISS_REL_DIR/run_with_parameters.sh $nproc $x $y $z $f $a $SCENARIO"
  echo "command=[$command]"
  qsub -q full.q -pe full_mpi_ff $nproc $command -o $OPENCMISS_EVALUATION_DIR/$SCENARIO | tee pid.txt
  pid=$(cat pid.txt | cut -c 10-14)
  status=$(qstat | grep $pid | cut -c 41-43) 
  
  echo "pid=[$pid], status=[$status], wait until program is finished"

  while [ "$status" != "" ]; do
    if [ "$previous_status" != "$status" ]; then
      echo "new status: $status"
    fi

    previous_status=$status
    sleep 1
    status=$(qstat | grep $pid | cut -c 41-43)   # e.g. 'r ' for running or 'qw' for queued or '  ' for finished
  done

  echo "program with parameters nproc=$nproc, (x,y,z,f,a)=($x,$y,$z,$f,$a) done"
}

nproc=1;  x=3;  y=4;  z=1;  f=1;  a=1;  execute_blocking
nproc=2;  x=3;  y=4;  z=2;  f=1;  a=1;  execute_blocking
nproc=4;  x=3;  y=8;  z=2;  f=1;  a=1;  execute_blocking
nproc=8;  x=6;  y=8;  z=2;  f=1;  a=1;  execute_blocking
nproc=12; x=6;  y=8;  z=3;  f=1;  a=1;  execute_blocking
nproc=16; x=6;  y=8;  z=4;  f=1;  a=1;  execute_blocking
nproc=24; x=6;  y=12; z=4;  f=1;  a=1;  execute_blocking
nproc=32; x=6;  y=16; z=4;  f=1;  a=1;  execute_blocking
nproc=64; x=12; y=16; z=4;  f=1;  a=1;  execute_blocking
nproc=96; x=12; y=16; z=6;  f=1;  a=1;  execute_blocking

echo "script done."
