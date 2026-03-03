#!/bin/sh
[ -n "$1" ] && [ -n "$2" ] || exit
name=$1
shift
set -v
rm -rf ~/.local/share/pipx/$name
/usr/bin/python3 -m venv ~/.local/share/pipx/$name
~/.local/share/pipx/$name/bin/pip install $@
cat > ~/.local/bin/$name <<EOF
#!/bin/sh
~/.local/share/pipx/$name/bin/$name \$@
EOF
chmod 755 ~/.local/bin/$name
