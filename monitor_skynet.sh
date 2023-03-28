#/bin/sh
if [ "$1" = "" ] | [ "$2" = "" ] | [ "$3" = "" ]; then
    echo "usage: monitor pid skynet_build_path service_id_in_decimal skynet_src_dir"
    exit 1
fi
sudo stap -B CONFIG_MODVERSIONS=y -v mini_skynet_lua_bt.stp --skip-badvars -x $1 $2/skynet $3 -g --suppress-time-limits -DMAXSTRINGLEN=65536 |tee temp.bt

$2/lua dump.lua $4 temp.bt | tee skynet.bt

rm -f temp.bt

./flamegraph.pl --width=2400 skynet.bt > skynet.svg

