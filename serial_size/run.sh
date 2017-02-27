
. ~/.bashrc.my
echo "ulimit -a"
ulimit -a
echo "cat /etc/security/limits.d/*"
cat /etc/security/limits.d/*
echo "cat /etc/security/limits.conf"
cat /etc/security/limits.conf
echo "qconf -sc"
qconf -sc
echo "qstat -F h_vmem"
qstat -F h_vmem
echo "qconf -srqsl"
qconf -srqsl

#echo "env:"
#env
echo "modules:"
module list
#cd $OPENCMISS_REL_DIR/..
#rm -rf CMakeFiles CMakeCache.txt
#echo "running cmake"
#/home/maierbn/OPENCMISS_ROOT/install/utilities/cmake/bin/cmake -DOPENCMISS_BUILD_TYPE=RELEASE -DCMAKE_BUILD_TYPE=RELEASE ..
#make clean
#make
#cd -

f=1
for n in {1..5}; do
  echo "n=$n, f=$f"
  $OPENCMISS_REL_DIR/cuboid $OPENCMISS_INPUT_DIR $n $n $n $f
done

