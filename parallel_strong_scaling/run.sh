# strong scaling

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


for p in 32 16 8 4 2 1; do
  check_exit
  echo "strong scaling p=$p"
  mpirun -n $p $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 8 8 8 1 2>&1 | tee -a out${p}.txt
done
