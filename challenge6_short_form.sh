#create user
sudo useradd -m -s /bin/bash challenge6
echo "challenge6:password" | sudo chpasswd

#create the nested zip files
sudo mkdir -p /home/challenge6/ctf_challenge
cd /home/challenge6/ctf_challenge

#python script to create nested zip files
sudo nano /home/challenge6/create_zip.py
#add the following script
import os
import zipfile

def create_ctf_structure(base_dir):
    for i in range(1, 101):
        dir_path = os.path.join(base_dir, f"folder{i}")
        os.makedirs(dir_path, exist_ok=True)
        with open(os.path.join(dir_path, f"file{i}.txt"), 'w') as f:
            f.write(f"This is file {i}.")
    os.makedirs(os.path.join(base_dir, "folder100"), exist_ok=True)
    with open(os.path.join(base_dir, "folder100/flag.txt"), 'w') as f:
        f.write("FLAG{hidden_flag_here}")

def zipdir(path, ziph):
    for root, dirs, files in os.walk(path):
        for file in files:
            ziph.write(os.path.join(root, file), os.path.relpath(os.path.join(root, file), os.path.join(path, '..')))

def create_zip_archives(base_dir):
    for i in range(1, 101):
        dir_path = os.path.join(base_dir, f"folder{i}")
        zip_path = os.path.join(base_dir, f"folder{i}.zip")
        with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
            zipdir(dir_path, zipf)

def create_final_zip(base_dir):
    with zipfile.ZipFile(f"{base_dir}.zip", 'w', zipfile.ZIP_DEFLATED) as zipf:
        zipdir(base_dir, zipf)

base_dir = "ctf_challenge"
create_ctf_structure(base_dir)
create_zip_archives(base_dir)
create_final_zip(base_dir)

#run the script
python3 /home/challenge6/create_zip.py
