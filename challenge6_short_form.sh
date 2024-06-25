#create user
sudo useradd -m -s /bin/bash challenge6
echo "challenge6:password" | sudo chpasswd

#create the nested zip files
sudo mkdir -p /home/challenge6/ctf_challenge
cd /home/challenge6/ctf_challenge

