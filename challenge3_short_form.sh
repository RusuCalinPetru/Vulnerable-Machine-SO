#create user
sudo useradd -m -s /bin/bash challenge3
echo "challenge3:password" | sudo chpasswd

#create the script
sudo nano /usr/local/bin/ls.sh
#add the following script
#!/bin/bash
sleep 1000 &
while true; do
    echo "---- System Information ----" >> /usr/logs/system_info.log
    date >> /usr/logs/system_info.log
    uptime >> /usr/logs/system_info.log
    free -m >> /usr/logs/system_info.log
    echo "" >> /usr/logs/system_info.log
    sleep 60
done &
python3 -m http.server 8081 &
nc -l -p 9090 > /usr/logs/nc_output.log &
bash -c 'a=0; b=1; while true; do echo $a > /usr/logs/fibonacci.log; fn=$((a + b)); a=$b; b=$fn; sleep 5; done' &
while true; do
    echo "---- Disk Usage ----" >> /usr/logs/disk_usage.log
    df -h >> /usr/logs/disk_usage.log
    echo "" >> /usr/logs/disk_usage.log
    sleep 60
done &
