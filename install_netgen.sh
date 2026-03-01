

set -x
rm -rf netgen
git clone https://github.com/RTimothyEdwards/netgen.git
cd netgen
case "$(uname -m)" in
   "arm64")
      ./configure \
         --prefix=$HOME/.local \
         --with-tcl=$HOME/.local/share/tcl-tk/lib \
         --with-tk=$HOME/.local/share/tcl-tk/lib \
         CFLAGS=-Wno-error=implicit-function-declaration
      ;;
   *) 
      sudo apt-get install -y build-essential tcl-dev tk-dev
      ./configure \
         --prefix=$HOME/.local
      ;;
esac
make
make install
cd ..
rm -rf netgen

