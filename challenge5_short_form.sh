#create user
sudo useradd -m -s /bin/bash challenge5
echo "challenge5:password" | sudo chpasswd

#create a script for Caesar Cipher and Base64 decryption
sudo nano /home/challenge5/decrypt.sh
#add the following script
#!/bin/bash
caesar_decrypt() {
    local text="$1"
    local shift="$2"
    local decrypted=""
    for ((i=0; i<${#text}; i++)); do
        char=${text:$i:1}
        if [[ $char =~ [A-Za-z] ]]; then
            if [[ $char =~ [A-Z] ]]; then
                base=65
            else
                base=97
            fi
            new_char=$(printf \\$(printf '%03o' $(( ( $(printf '%d' "'$char") - $base - $shift + 26 ) % 26 + $base ))))
            decrypted+="$new_char"
        else
            decrypted+="$char"
        fi
    done
    echo "$decrypted"
}
base64_decode() {
    echo -n "$1" | base64 --decode
}
encrypted_text="Y29td29u"
base64_decoded=$(base64_decode "$encrypted_text")
echo "Base64 decoded text: $base64_decoded"
for shift in {1..10}; do
    caesar_decrypted=$(caesar_decrypt "$base64_decoded" "$shift")
    echo "Caesar decryption with shift $shift: $caesar_decrypted"
done
