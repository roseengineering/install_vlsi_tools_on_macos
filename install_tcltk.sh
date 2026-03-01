
set -x
version=8.6.17
tcl_package=tcl${version}
tk_package=tk${version}

case "$(uname -m)" in
   "arm64")
      ;;
   *) 
      sudo apt-get install -y tk${version%.*}-dev tcl${version%.*}-dev
      exit
      ;;
esac

############

rm -rf ${tcl_package}
curl -LO https://sourceforge.net/projects/tcl/files/Tcl/${version}/${tcl_package}-src.tar.gz
tar xf ${tcl_package}-src.tar.gz
rm ${tcl_package}-src.tar.gz
cd ${tcl_package}/unix
./configure --prefix=$HOME/.local/share/tcl-tk
make -j4
make install
cd ../..

############

rm -rf ${tk_package}
curl -LO https://sourceforge.net/projects/tcl/files/Tcl/${version}/${tk_package}-src.tar.gz
tar xf ${tk_package}-src.tar.gz
rm ${tk_package}-src.tar.gz
cd ${tk_package}/unix
./configure --prefix=$HOME/.local/share/tcl-tk --with-tcl=$HOME/.local/share/tcl-tk/lib
make -j4
make install
cd ../..
rm -rf ${tk_package}
rm -rf ${tcl_package}


