#!  /usr/bin/bash

cd $my_tools_dir
pwd
gitpull(){
  DONE=0
  while [ $DONE -ne 0  ]; do
    git pull --recursive $1
    let DONE=$?
  done
}

# neovim
echo "--------------------"
echo "Updating neovim:"
cd neovim
pwd
gitpull master
make && sudo make install
cd ..
pwd
echo "neovim Done"

# ccls
echo "--------------------"
echo "Updating ccls:" 
cd ccls
pwd
gitpull master
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
gitpull master
./autogen.sh
./configure
make && sudo make install
cd ..
pwd
echo "mosh Done"

echo "--------------------"
echo "Updating git:"
cd git
pwd
gitpull master
make prefix=/usr all doc info
sudo make prefix=/usr install install-doc install-html install-info
cd ..
pwd
echo "git Done"

echo "--------------------"
echo "Updating SSRSpeed:"
cd SSRSpeed
pwd
gitpull master
cd ..
pwd
echo "SSRSpeed Done"
echo "--------------------"
