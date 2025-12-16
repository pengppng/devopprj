#!/bin/bash
# Linux
echo " SERVER PERFORMANCE STATISTICS"
echo

# OS INFO
echo "🖥️ OS Information:"
uname -a
echo

# UPTIME & LOAD
echo "⏱️ Uptime and Load Average:"
uptime
echo

# CPU USAGE
echo "🔥 Total CPU Usage:"
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
echo "CPU Usage: $CPU_USAGE"
echo

# MEMORY USAGE
echo "🧠 Memory Usage:"
free -h | awk '
/Mem:/ {
    used=$3; total=$2;
    printf "Used: %s / Total: %s (%.2f%%)\n", used, total, ($3/$2)*100
}'
echo

# DISK USAGE
echo "💾 Disk Usage:"
df -h / | awk '
NR==2 {
    printf "Used: %s / Total: %s (Used %s)\n", $3, $2, $5
}'
echo

# TOP 5 CPU PROCESSES
echo "🚀 Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo

# TOP 5 MEMORY PROCESSES
echo "📊 Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo

# LOGGED IN USERS
echo "👥 Logged in Users:"
who
echo

# FAILED LOGIN ATTEMPTS (Stretch)
echo "❌ Failed Login Attempts:"
if [ -f /var/log/auth.log ]; then
    grep "Failed password" /var/log/auth.log | tail -n 5
else
    echo "No auth.log found (permission required)"
fi

echo
echo " END OF REPORT"
