#create user and directories
sudo useradd -m -s /bin/bash challenge4
echo "challenge4:password" | sudo chpasswd

#create the flag file
sudo mkdir -p /home/challenge4/flag
echo "FLAG{hidden_flag_here}" > /home/challenge4/flag/flag.txt
zip -e -P 'study.quack.flanked' /home/challenge4/flag/flag.zip /home/challenge4/flag/flag.txt
