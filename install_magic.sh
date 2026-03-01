
# install qt either on mac or linux to enable cairo support

set -x
rm -rf magic
git clone https://github.com/RTimothyEdwards/magic
cd magic

case "$(uname -m)" in
   "arm64")
      brew install gnu-sed
      ./configure \
         --prefix=$HOME/.local \
         --with-tcl=$HOME/.local/share/tcl-tk/lib \
         --with-tk=$HOME/.local/share/tcl-tk/lib \
         --with-opengl=no
      ;;
   *) 
      sudo apt-get install -y build-essential tcl-dev tk-dev libx11-dev
      sudo apt-get install -y freeglut3-dev libglu1-mesa-dev libgl1-mesa-dev # needed for ogl
      ./configure \
         --prefix=$HOME/.local \
         --with-opengl=yes
      ;;
esac
make
make install
cd ..
rm -rf magic

