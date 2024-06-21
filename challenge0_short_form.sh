sudo useradd -m -s /bin/bash stud3nt
echo "stud3nt:student" | sudo chpasswd

#restrict permissions and commands
sudo chsh -s /bin/bash stud3nt
sudo rm /home/stud3nt/.bash_profile
sudo chmod 700 /home/*
sudo chmod 755 /home/stud3nt
sudo setfacl -m u:stud3nt:--x /etc
sudo setfacl -m u:stud3nt:--x /var
sudo setfacl -m u:stud3nt:--x /bin
sudo setfacl -m u:stud3nt:--x /sbin
sudo setfacl -m u:stud3nt:--x /usr

#update .bashrc
sudo nano /home/stud3nt/.bashrc
#add the following
cd() {
    if [ "$1" != "" ] && [ "$1" != "$HOME" ] && [[ "$1" != $HOME/* ]]; then
        echo "You cannot change to that directory."
    else
        builtin cd "$@"
    fi
}
export PATH=$PATH:/bin:/usr/bin
PS1='restricted-shell:\w\$ '

#source the updated profile
sudo nano /home/stud3nt/.bash_profile
source ~/.bashrc
