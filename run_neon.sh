# script for neon

while true; do
  parallel_weak_scaling/run_neon.sh
  parallel_strong_scaling/run_neon.sh
done
