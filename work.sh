. ~/.bashrc
cd /home/maierbn/Documents/opencmiss/iron_thomas_unofficial/manage/build_release
ccc && cmake -DOPENCMISS_BUILD_TYPE=RELEASE -DCMAKE_BUILD_TYPE=RELEASE -DEVIL=1 .. && make all && make install
cd /home/maierbn/Documents/opencmiss/examples/cuboid/build_release
cmake -DOPENCMISS_BUILD_TYPE=RELEASE -DCMAKE_BUILD_TYPE=RELEASE .. && make clean && make
cd /home/maierbn/Documents/opencmiss/examples/cuboid/evaluation/parallel_weak_scaling
while true; do
   echo "run"
   run_neon.sh
done
