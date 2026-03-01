
set -x
version=45.2
package=ngspice-${version}

rm -rf ${package}
curl -LO https://sourceforge.net/projects/ngspice/files/ng-spice-rework/${version}/${package}.tar.gz
tar xf ${package}.tar.gz 
rm ${package}.tar.gz
cd ${package}
mkdir -p release 

case "$(uname -m)" in
   "arm64")
      brew install automake autoconf libtool
      glibtoolize --force --copy
      aclocal
      autoheader
      automake --add-missing --copy
      autoconf
      cd release 
      ../configure \
         CFLAGS=-Wno-error=implicit-function-declaration \
         --prefix=$HOME/.local \
         --disable-debug \
         --disable-openmp \
         --with-readline=no \
         --without-x 
      ;;
   *)
      sudo apt-get install -y build-essential automake autoconf libtool
      sudo apt-get install -y flex bison libreadline-dev
      cd release 
      ../configure \
         --prefix=$HOME/.local \
         --disable-debug \
         --disable-openmp \
         --without-x
      ;;
esac

make
make install
cd ../..
rm -rf ${package}


