
set -x
rm -rf xschem
git clone https://github.com/StefanSchippers/xschem.git
cd xschem
make clean
case "$(uname -m)" in
   "arm64")
      LIBRARY_PATH="$HOME/.local/lib" \
      ./configure \
         --prefix=$HOME/.local 
      sed -i.bu 's:CFLAGS=:CFLAGS=-Wno-error=implicit-function-declaration -I/opt/X11/include -I$(HOME)/.local/include :' Makefile.conf
      sed -i.bu 's:LDFLAGS=:LDFLAGS=-L$(HOME)/.local/lib :' Makefile.conf
      ;;
   *) 
      ./configure \
         --prefix=$HOME/.local 
      ;;
esac
make 
make install
cd ..
rm -rf xschem

