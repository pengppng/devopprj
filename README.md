https://roadmap.sh/projects/server-stats

Total CPU usage
Total memory usage (Free vs Used including percentage)
Total disk usage (Free vs Used including percentage)
Top 5 processes by CPU usage
Top 5 processes by memory usage

| Command             | Description                                                                            |
| ------------------- | -------------------------------------------------------------------------------------- |
| `top -bn1`          | Retrieves total CPU usage by running the `top` command in batch mode for one iteration |
| `free -h`           | Displays memory usage, including used and free memory in a human-readable format       |
| `df -h`             | Shows disk space usage for mounted file systems in a human-readable format             |
| `ps -eo`            | Lists running processes with specified output format (PID, command, CPU/memory usage)  |
| `uptime`            | Displays system uptime and load average                                                |
| `who`               | Shows currently logged-in users                                                        |
| `/var/log/auth.log` | Records authentication-related events, including failed login attempts                 |

Notes
The script is designed to run on Linux-based systems.
Some commands (e.g., free, top -bn1) are not available on macOS due to differences between GNU and BSD utilities.
Access to /var/log/auth.log may require root privileges on some systems.