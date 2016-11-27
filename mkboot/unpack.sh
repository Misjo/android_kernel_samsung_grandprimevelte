#!/bin/bash
rm -rf boot
mkdir boot
tools/degas-unpackbootimg -i boot.img -o boot
mkdir -p boot/ramdisk
cd boot/ramdisk/
gunzip -c ../boot.img-ramdisk.gz | cpio -i
cd ..
