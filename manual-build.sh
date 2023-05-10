#!/bin/bash
DEVMODE=true

BUILD_DIR=build
ISO_URL="https://releases.ubuntu.com/22.04.2/ubuntu-22.04.2-live-server-amd64.iso"
ISO_NAME="ubuntu-22.04.2-live-server-amd64.iso"

mkdir -p $BUILD_DIR
pushd $BUILD_DIR

# Download iso
if ! [ -f ./$ISO_NAME ] || ! $DEVMODE
then
    wget $ISO_URL -O $ISO_NAME
fi

# extract to work folder
mkdir -p source
7z -y x $ISO_NAME -osource

cd source
mv  '[BOOT]' ../BOOT

# Add auto install grub entry
cp ../../source/boot/grub/grub.cfg ./boot/grub/grub.cfg


popd