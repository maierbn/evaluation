#!/bin/bash 
# weak scaling

export SCENARIO=parallel_strong_scaling

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


for nproc in 1 2 4 8 16 32 64 80 96 128 160 192
do
  x=16; y=16;  z=4;  f=1;  a=1;  execute_blocking
done

echo "script done."
