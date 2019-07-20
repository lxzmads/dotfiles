# Change iterm2's tab color automatically
hostfp=$(hostname | md5sum || md5sum );
hash=$(echo ${hostfp:0:2} | tr a-z A-Z);
num=$(echo "obase=10; ibase=16; $hash" | bc)
echo "\033]6;1;bg;*;default\a"
echo "\033]6;1;bg;red;brightness;$num\a"
echo "\033]6;1;bg;green;brightness;$num\a"
echo "\033]6;1;bg;blue;brightness;10$num\a"
clear