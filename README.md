
## VLSI design software installation for macOS (arm) and Debian/Ubuntu Linux

I created the following scripts to install Magic,
Netgen, the Skywatch130 PDK, Xschem, and Yosys on my Mac and Debian Linux machines.
I hope they may be helpful to you and spare you the agony of installing them on macOS.
The scripts detect whether they are running on macOS or Linux and build accordingly.
For macOS brew is used to install dependences while for Linux apt-get is used.

### Install Tcl/Tk for macOS

First off, Homebrew's version of tcl-tk is not compatible
with Magic.  From my experiments, even if Magic is 
compiled with brew's tcl-tk8.6, the app will crash.
This is because of a conflict between the two windowing
systems compiled into resulting magic binary, X11 and macOS native.  

Therefore to install Magic on macOS you have to compile
tcl-tk yourself.  So if you are on a macOS, install tcl-tk locally 
using:
   -  [install\_tcltk.sh](install_tcltk.sh).

Running this script on Linux will apt install tcl-dev and tk-dev.

### Install Magic 

Run [install\_magic.sh](install_magic.sh) to install Magic.
Since openGL fails on macOS it is disabled in
the macOS build.

### Install Remaining Apps

Run the following scripts to install the rest of the apps:

   - Netgen: [install\_netgen.sh](install_netgen.sh)
   - Ngspice: [install\_ngspice.sh](install_ngspice.sh)
   - Xschem: [install\_xschem.sh](install_xschem.sh)
   - Yosys: [install\_yosys.sh](install_yosys.sh)
   - Tkcon: [install\_tkconrc.sh](install_tkconrc.sh)

Note, install\_tkconrc.sh also installs the tkcon console program along
with the .tkconrc file, which sets a large font for Magic.

### Install the Skywatcher130 PDK for macOS or Linux

   - Skywater130 PDK: [install\_pdk.sh](install_pdk.sh)

Ensure the environment variable PDK\_ROOT is set to "$HOME/.cache/volare", in
say .bashrc or .zshrc, before running magic so you can 
access the PDK in the app.  This script also installs
cicconf, cicsim, cicpy, and volare using pip install.  My script
pipx.sh, included here, performs the actual installation.


