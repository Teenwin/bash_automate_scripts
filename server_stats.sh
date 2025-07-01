#!/bin/sh
echo "-------------load average----------------";
uptime | awk '{print $8,$9,$10}';
echo "-------------free and use memory----------------";
free -h | awk '{print $1,$2,$3}' | sed 's/total/type/';
echo "-------------free space----------------";
df -h | awk '{print $1,$2,$3,$5}' | grep -v tmpfs | grep dev;
echo "-------------five process by memory use----------------";
ps -Ao %mem,user,pid,%cpu,time,comm --sort=-%mem | head -n 6;
echo "-------------five process by proc----------------";
ps -Ao pcpu,user,pid,%mem,time,comm --sort=-pcpu | head -n 6;
echo "-------------description version----------------";
lsb_release -a | grep Description;
echo "-------------login users----------------";
w -hip;
