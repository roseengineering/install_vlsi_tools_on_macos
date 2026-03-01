
## VLSI design software installation for macOS (arm) and Debian/Ubuntu Linux

I created the following scripts to install Magic,
Netgen, the Skywatch130 PDK, Xschem, and Yosys on my Mac.
I hope they may be helpful to others.

### Install Tcl/Tk for macOS

First off, Homebrew's version of tcl-tk is not compatible
with Magic.  From my experiements, even if Magic is 
compiled with brew's tcl-tk 8.6, the app will crash.
This is because of a conflict between the two windowing
systems compiled into it, X11 and macOS Native.  

Therefore to install Magic on macOS you have to compile
tcl-tk yourself.

So if you are on a macOS, install tcl-tk locally 
using:
   -  [install\_tcltk.sh](install_tcltk.sh).

Running this script on Linux will apt install tcl-dev and tk-dev.

### Install Magic for macOS or Linux

Run [install\_magic.sh](install_magic.sh) to install Magic.
Since openOGL fails on macOS it is disabled.

### Install the remaining apps for macOS or Linux

Run the following scripts to install the rest of the apps:

   - Netgen: [install\_netgen.sh](install_netgen.sh)
   - Ngspice: [install\_ngspice.sh](install_ngspice.sh)
   - Xschem: [install\_xschem.sh](install_xschem.sh)
   - Yosys: [install\_yosys.sh](install_yosys.sh)
   - Tkcon: [install\_tkconrc.sh](install_tkconrc.sh)

Note, tkcon installs the tkcon console program along
with a .tkconrc file, with a large font set for Magic.

### Install the Skywatcher130 PDK for macOS or Linux

   - Skywater130 PDK: [install\_pdk.sh](install_pdk.sh)

Ensure the environment variable PDK\_ROOT is set to "$HOME/.cache/volare", in
say .bashrc or .zshrc, before running magic so you can 
access the PDK in the app.  This script also installs
cicconf, cicsim, and volare using pip install.  My script
pipx.sh, included here, performs the actual installation.


