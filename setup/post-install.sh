#!/usr/bin/sh

set -ex

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg -y
sudo apt-get install build-essential ninja-build -y

echo "DONE"
