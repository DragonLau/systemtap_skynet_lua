#/bin/sh
if [ "$1" = "" ] | [ "$2" = "" ] | [ "$3" = "" ]; then
    echo "usage: monitor lua_bin_path lua_src_dir lua_file"
    exit 1
fi
stap -v mini_lua_bt.stp -g -c "$1 $3" "$1" -BCONFIG_MODULE_SIG=n --suppress-time-limits -DMAXSTRINGLEN=65536  |tee temp.bt

$1 dump.lua $2 temp.bt | tee lua.bt

rm -f temp.bt

./flamegraph.pl --width=2400 lua.bt > lua.svg

