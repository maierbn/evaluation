
while true; do

  echo "strong scaling"
  cd $OPENCMISS_EVALUATION_DIR/parallel_strong_scaling
  time ./run.sh
 
  echo "weak scaling"
  cd $OPENCMISS_EVALUATION_DIR/parallel_weak_scaling
  time ./run.sh
  
  echo "serial scaling"
  cd $OPENCMISS_EVALUATION_DIR/serial_scaling
  time ./run.sh

done

