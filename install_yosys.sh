
set -x
rm -rf yosys
git clone --recurse-submodules https://github.com/YosysHQ/yosys.git
cd yosys

case "$(uname -m)" in
   "arm64")
      # tcl should be already installed
      brew install bison flex libffi pkgconfig zlib readline
      make config-clang PREFIX=$HOME/.local
      ;;
   *) 
      sudo apt-get install -y build-essential tcl-dev bison flex pkg-config
      sudo apt-get install -y lld libffi-dev libfl-dev libreadline-dev
      make config-gcc PREFIX=$HOME/.local
      ;;
esac

make -j4 PREFIX=$HOME/.local
make install PREFIX=$HOME/.local
cd ..
rm -rf yosys



