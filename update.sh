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

# ccls
echo "--------------------"
echo "Updating ccls:" 
cd $my_tools_dir/ccls
gitpull origin master
cmake -H. -Brelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=../clang+llvm
cmake --build release
echo "ccls Done"

# anaconda
echo "--------------------"
echo "Updating conda3:"
cd $my_tools_dir/anaconda3/bin
./conda update --prefix $my_tools_dir/anaconda3 anaconda -y 
echo "anaconda3 Done"

# mosh
echo "--------------------"
echo "Updating mosh:"
cd $my_tools_dir/mosh
gitpull origin master
./autogen.sh
./configure
make && sudo make install
echo "mosh Done"

echo "--------------------"
echo "Updating git:"
cd $my_tools_dir/git
gitpull origin master
make prefix=/usr all doc info
sudo make prefix=/usr install install-doc install-html install-info
echo "git Done"

echo "--------------------"
echo "Updating SSRSpeed:"
cd $my_tools_dir/SSRSpeed
gitpull origin master
echo "SSRSpeed Done"
echo "--------------------"
