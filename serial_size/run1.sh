
. ~/.bashrc.my
#echo "env:"
#env
echo "ulimit"
ulimit
echo ""
echo "modules:"
module list
cd $OPENCMISS_REL_DIR/..
#rm -rf CMakeFiles CMakeCache.txt
#echo "running cmake"
#/home/maierbn/OPENCMISS_ROOT/install/utilities/cmake/bin/cmake -DOPENCMISS_BUILD_TYPE=RELEASE -DCMAKE_BUILD_TYPE=RELEASE ..
#make clean
#make
cd -

f=1
n=1
  echo "n=$n, f=$f"
  $OPENCMISS_REL_DIR/laplace_fortran $OPENCMISS_INPUT_DIR $n $n $n $f

