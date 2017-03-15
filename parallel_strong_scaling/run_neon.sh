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

while true; do
  check_exit


  for p in 48 36 24 18 16 12 9 8 6 4 3 2 1; do
    check_exit
    echo $p
    mpirun -n $p $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR 12 12 12 1 2>&1 | tee -a out${p}.txt
  done

done
