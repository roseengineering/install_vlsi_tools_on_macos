
curl -L https://raw.githubusercontent.com/wjoye/tkcon/master/tkcon.tcl -o ~/.local/bin/tkcon
sed -i '' 's:exec wish:exec ~/.local/share/tcl-tk/bin/wish8.6:' ~/.local/bin/tkcon 
chmod 755 ~/.local/bin/tkcon

cat > ~/.tkconrc <<EOF
tkcon font 9x15bold
EOF

