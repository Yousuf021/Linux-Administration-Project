#!/bin/bash


if [ $# -lt 3 ]; then
    echo "Error: Missing arguments."
    echo "Usage: $0 <username> <userpass> <groupname>"
    exit 1
fi

USERNAME=$1
USERPASS=$2
GROUPNAME=$3

if [ "$USER" != "root" ] && [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run with sudo permissions."
    exit 1
fi

echo "Username: $USERNAME"
echo "Password: $USERPASS"
echo "Groupname: $GROUPNAME"

useradd -m -s /bin/bash -N "$USERNAME"

echo "$USERNAME:$USERPASS" | chpasswd

echo "Initial user info:"
id "$USERNAME"

groupadd -g 200 "$GROUPNAME"
usermod -aG "$GROUPNAME" "$USERNAME"

echo "After adding to group:"
id "$USERNAME"

usermod -u 1600 -g "$GROUPNAME" "$USERNAME"

echo "Final user info:"
id "$USERNAME"
