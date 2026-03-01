
set -x
sh pipx.sh cicconf
sh pipx.sh cicsim cicsim pyyaml click tabulate
sh pipx.sh volare

pdk=bdc9412b3e468c102d01b7cf6337be06ec6e9c9a

# pdk
volare ls-remote --pdk sky130
volare enable --pdk-root ~/.cache/volare --pdk sky130 ${pdk}

# magicrc
ln -fs ~/.cache/volare/sky130A/libs.tech/magic/sky130A.magicrc ~/.magicrc

