#!/bin/bash

echo " SERVER PERFORMANCE STATISTICS"
echo

# OS INFO
echo "🖥️ OS Information:"
sw_vers
echo

# UPTIME & LOAD
echo "⏱️ Uptime and Load Average:"
uptime
echo

# CPU USAGE
echo "🔥 Total CPU Usage:"
top -l 1 | grep "CPU usage" | awk '{print $3 + $5 "%"}'
echo

# MEMORY USAGE
echo "🧠 Memory Usage:"
vm_stat | awk '
/Pages free/ {free=$3}
/Pages active/ {active=$3}
/Pages inactive/ {inactive=$3}
/Pages wired/ {wired=$3}
END {
    total=(free+active+inactive+wired)*4096/1024/1024
    used=(active+inactive+wired)*4096/1024/1024
    printf "Used: %.2f MB / Total: %.2f MB (%.2f%%)\n", used, total, (used/total)*100
}'
echo

# DISK USAGE
echo "💾 Disk Usage:"
df -h / | tail -1 | awk '{print "Used:", $3, "/", $2, "(", $5, ")"}'
echo

# TOP CPU PROCESSES
echo "🚀 Top 5 Processes by CPU Usage:"
ps -arcwwwxo pid,command,%cpu | head -n 6
echo

# TOP MEMORY PROCESSES
echo "📊 Top 5 Processes by Memory Usage:"
ps -arcwwwxo pid,command,%mem | head -n 6
echo

# LOGGED IN USERS
echo "👥 Logged in Users:"
who
echo

echo " END OF REPORT"
