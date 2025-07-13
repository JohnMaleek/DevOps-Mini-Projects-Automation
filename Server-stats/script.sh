#!/bin/bash
sudo apt install finger
print_frame() {
  echo "==============================="
  echo "|$1|"
  echo "==============================="
}

print_frame  "You are Login with '$(whoami)' user and this all information about user"
finger -l $whoami
echo""

print_frame "CPU Usage"
top -bn1 | grep "Cpu(s)"

echo ""
print_frame "Memory Usage"
free -h

echo ""
free -h | sed -n '2p' | awk '{printf "Used: " $3 " / Total: " $2 " ( " $3*100/$2 "%% )" }'

echo ""
print_frame "Disk Usage"
df -h /

echo ""
print_frame "Top 5 Processes by CPU"
ps aux --sort=-%cpu | head -n 5



echo ""
print_frame "Top 5 Processes by Memory"
ps aux --sort=-%mem | head -n 5

echo ""
print_frame "Information about Operation System"
cat /etc/os-release | head -n 7


