#!/bin/sh
[ -n "$1" ] || exit
rm -rf ~/.local/share/pipx/$1
/usr/bin/python3 -m venv ~/.local/share/pipx/$1
if [ -n "$2" ]; then
   ~/.local/share/pipx/$1/bin/pip install ${@:2}
else
   ~/.local/share/pipx/$1/bin/pip install $1
fi
cat > ~/.local/bin/$1 <<EOF
#!/bin/sh
~/.local/share/pipx/$1/bin/$1 \$@
EOF
chmod 755 ~/.local/bin/$1
