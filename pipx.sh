#!/bin/sh
[ -n "$1" ] && [ -n "$2" ] || exit
rm -rf ~/.local/share/pipx/$1
/usr/bin/python3 -m venv ~/.local/share/pipx/$1
~/.local/share/pipx/$1/bin/pip install ${@:2}
cat > ~/.local/bin/$1 <<EOF
#!/bin/sh
~/.local/share/pipx/$1/bin/$1 \$@
EOF
chmod 755 ~/.local/bin/$1
