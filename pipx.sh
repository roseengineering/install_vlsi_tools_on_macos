#!/bin/sh
[ -n "$1" ] && [ -n "$2" ] || exit
name=$1
prefix=$HOME/.local/share/pipx/$name
shift
set -v
rm -rf $prefix
/usr/bin/python3 -m venv $prefix
$prefix/bin/pip install $@
cat > ~/.local/bin/$name <<EOF
#!/bin/sh
PATH="$prefix/bin:\$PATH"
unset CONDA_PREFIX
export VIRTUAL_ENV=$prefix
$prefix/bin/$name \$@
EOF
chmod 755 ~/.local/bin/$name
