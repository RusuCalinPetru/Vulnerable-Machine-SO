#create user and directories
sudo useradd -m -s /bin/bash challenge2
echo "challenge2:password" | sudo chpasswd

#set up the custom image
sudo mkdir -p /home/challenge2/image
cp /path/to/image.png /home/challenge2/image/image.png
exiftool -Description="Your hidden password is: f111rst_" /home/challenge2/image/image.png
