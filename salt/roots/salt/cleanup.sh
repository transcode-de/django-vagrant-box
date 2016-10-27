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
apt-get -y autoclean
apt-get -y clean

echo "Removing man pages"
rm -rf /usr/share/man/*

echo "Removing APT files"
find /var/lib/apt -type f | xargs rm -f

echo "Removing any docs"
rm -rf /usr/share/doc/*

echo "Removing caches"
find /var/cache -type f -exec rm -rf {} \;

echo "Disk usage after cleanup"
df -h
