#!/usr/bin/env bash
# Clean up to free some space

set -o errexit
set -o nounset
set -o pipefail
set -o verbose

echo "Disk usage before cleanup"
df -h

echo "Cleaning up the APT cache"
apt-get -y autoremove --purge
apt-get -y clean
apt-get -y autoclean

echo "Removing man pages"
rm -rf /usr/share/man/*

echo "Removing APT files"
find /var/lib/apt -type f | xargs rm -f

echo "Removing any docs"
rm -rf /usr/share/doc/*

echo "Removing caches"
find /var/cache -type f -exec rm -rf {} \;

# Whiteout root
count=$(df --sync -kP / | tail -n1  | awk -F ' ' '{print $4}')
let count--
dd if=/dev/zero of=/tmp/whitespace bs=1024 count=$count
rm /tmp/whitespace

# Whiteout /boot
count=$(df --sync -kP /boot | tail -n1 | awk -F ' ' '{print $4}')
let count--
dd if=/dev/zero of=/boot/whitespace bs=1024 count=$count
rm /boot/whitespace

echo 'Clear out swap and disable until reboot'
set +e
swapuuid=$(/sbin/blkid -o value -l -s UUID -t TYPE=swap)
case "$?" in
    2|0) ;;
    *) exit 1 ;;
esac
set -e
if [ "x${swapuuid}" != "x" ]; then
    # Whiteout the swap partition to reduce box size
    # Swap is disabled till reboot
    swappart=$(readlink -f /dev/disk/by-uuid/$swapuuid)
    /sbin/swapoff "${swappart}"
    dd if=/dev/zero of="${swappart}" bs=1M || echo "dd exit code $? is suppressed"
    /sbin/mkswap -U "${swapuuid}" "${swappart}"
fi

# Zero out the free space to save space in the final image
dd if=/dev/zero of=/EMPTY bs=1M  || echo "dd exit code $? is suppressed"
rm -f /EMPTY

echo "Disk usage after cleanup"
df -h
