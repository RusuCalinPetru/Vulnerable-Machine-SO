# Vulnerable-Machine-SO

This repository contains various Capture the Flag (CTF) challenges designed to help students explore and learn about Linux system administration and cybersecurity. The setup involves multiple user accounts, each with a unique challenge, and restricted environments to ensure a controlled learning experience.

## Table of Contents
1. [Setup Instructions](#setup-instructions)
2. [Challenges](#challenges)
   - [Challenge 0: Discover Linux](#challenge-0-discover-linux)
   - [Challenge 1: Hidden Files](#challenge-1-hidden-files)
   - [Challenge 2: OSINT and Image Analysis](#challenge-2-osint-and-image-analysis)
   - [Challenge 3: Process Exploration](#challenge-3-process-exploration)
   - [Challenge 4: OSINT with What3Words](#challenge-4-osint-with-what3words)
   - [Challenge 5: Caesar Cipher and Base64](#challenge-5-caesar-cipher-and-base64)
   - [Challenge 6: Boom Mega Explode Archive](#challenge-6-boom-mega-explode-archive)
3. [Setup Details](#setup-details)
4. [Challenge Details](#challenge-details)

---

## Setup Instructions

1. **Install Ubuntu Server:**
   - Set up an Ubuntu server and configure SSH access.

2. **Create User Accounts:**
   - Create user accounts for each challenge with specific permissions and configurations.

3. **Configure SSH:**
   - Restrict SSH access to specific users and customize the SSH welcome message.

4. **Set Up Challenges:**
   - Follow the instructions for each challenge to create files, scripts, and directories.

## Challenges

### Challenge 0: Discover Linux

- **User:** `stud3nt`
- **Password:** `student`
- **SSH Access:** Only via port 2222 (e.g., `ssh -p 2222 student@ip_addr`)
- **Tasks:**
  - Search for the hidden `.flag` file within the home directory using basic commands (`ls`, `cd`, `cat`, `strings`).
  - Permissions are restricted to prevent access to other users' directories and system files.

### Challenge 1: Hidden Files

- **User:** `challenge1`
- **Tasks:**
  - Search for three files containing parts of a second password hidden among numerous files named with numbers and letters.
  - Use commands like `find` and `cat` to locate and read these files.

### Challenge 2: OSINT and Image Analysis

- **User:** `challenge2`
- **Tasks:**
  - Upon boot, a custom image containing a hidden description is displayed.
  - Extract the password hidden in the image description using `exiftool`.

### Challenge 3: Process Exploration

- **User:** `challenge3`
- **Tasks:**
  - Automatically execute various background processes upon login.
  - Answer questions about the system and processes, such as identifying the last command run, the number of log files created, and the ports being used.

### Challenge 4: OSINT with What3Words

- **User:** `challenge4`
- **Tasks:**
  - Use the What3Words address `study.quack.flanked` to find the password.
  - Unzip a file containing the flag and locate it within the extracted files.

### Challenge 5: Caesar Cipher and Base64

- **User:** `challenge5`
- **Tasks:**
  - Decrypt a text that has been encoded with a Caesar cipher (with up to 10 shifts) and then encoded in Base64.
  - Use a script to automate the decryption process and find the hidden flag.

### Challenge 6: Boom Mega Explode Archive

- **User:** `challenge6`
- **Tasks:**
  - Extract multiple nested zip files to locate a hidden flag.
  - Use a script to recursively unzip files and search for the flag.

## Setup Details

### General User Setup

```sh
# Create a user
sudo useradd -m -s /bin/bash <username>
# Set password
echo "<username>:<password>" | sudo chpasswd
