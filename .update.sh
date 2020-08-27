#! /bin/bash

cd $my_tools_dir
pwd
gitpull(){
  git checkout $2
  git reset --hard HEAD
  DONE=1
  while [ $DONE -ne 0  ]; do
    git pull --rebase --recurse-submodules $1 $2
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
echo "Updating neovim:"
cd $my_tools_dir/neovim
gitpull origin master
make && sudo make install
echo "neovim Done"
