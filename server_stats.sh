#!/bin/sh
echo "-------------show load average----------------";
uptime | awk '{print $8,$9,$10}';
echo "-------------show free and use memory----------------";
free -h | awk '{print $1,$2,$3}' | sed 's/total/type/';
echo "-------------show free space----------------";
df -h | awk '{print $1,$2,$3,$5}' | grep -v tmpfs;
echo "-------------show five process by memory use----------------";
ps -Ao %mem,user,pid,%cpu,time,comm --sort=-%mem | head -n 6;
echo "-------------show five process by proc----------------";
ps -Ao pcpu,user,pid,%cpu,time,comm --sort=-pcpu | head -n 6;
echo "-------------show description version----------------";
lsb_release -a | grep Description;
echo "-------------show login users----------------";
w;
