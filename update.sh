#! /bin/bash

cd $my_tools_dir
pwd
gitpull(){
  git checkout $2
  git reset --hard HEAD
  DONE=1
  while [ $DONE -ne 0  ]; do
    git pull --recurse-submodules $1 $2
    let DONE=$?
  done
}

# neovim
echo "--------------------"
echo "Updating neovim:"
cd neovim
pwd
gitpull origin master
make && sudo make install
cd ..
pwd
echo "neovim Done"

# ccls
echo "--------------------"
echo "Updating ccls:" 
cd ccls
pwd
gitpull origin master
cmake -H. -Brelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=../clang+llvm
cmake --build release
cd ..
pwd
echo "ccls Done"

# anaconda
echo "--------------------"
echo "Updating anaconda3:"
cd anaconda3/bin
pwd
./conda update --prefix /home/black_desk/tools/anaconda3 anaconda -y 
cd ../..
pwd
echo "anaconda3 Done"

# mosh
echo "--------------------"
echo "Updating mosh:"
cd mosh
pwd
gitpull origin master
./autogen.sh
./configure
make && sudo make install
cd ..
pwd
echo "mosh Done"

echo "--------------------"
echo "Updating SSRSpeed:"
cd SSRSpeed
pwd
gitpull origin master
cd ..
pwd
echo "SSRSpeed Done"
echo "--------------------"
