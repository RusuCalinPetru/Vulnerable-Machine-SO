#create user and directories
sudo useradd -m -s /bin/bash challenge1
echo "challenge1:password" | sudo chpasswd
sudo mkdir -p /home/challenge1/{Desktop,Documents,Downloads,Music,Pictures,Public,Templates,Videos}
sudo chown -R challenge1:challenge1 /home/challenge1/*

#create the CTF challenge files
sudo mkdir -p /home/challenge1/ctf_challenge
cd /home/challenge1/ctf_challenge
echo "_" > 1_101l
echo "my_" > 1_1o11
echo "to" > 0_0o0
