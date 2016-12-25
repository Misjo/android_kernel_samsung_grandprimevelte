#!/bin/bash
echo "To make a boot.img, a hex editor and some editing is required, please provide your password so that apt-get can install it" 
sudo apt-get install bless
make clean
make -j5
cd mkboot
./unpack.sh
cp ../arch/arm64/boot/Image.gz boot/Image.gz
bless boot.img boot/Image.gz boot/boot.img-zImage
./tools/degas-mkbootimg --kernel boot/image2.gz --ramdisk boot/boot.img-ramdisk.gz --dt boot/boot.img-dt --signature boot/boot.img-signature -o boot2.img
rm -rf ../boot.img
mv boot2.img ../boot.img
cd ..
tar -H ustar -c boot.img > boot.tar
md5sum -t boot.tar >> boot.tar
mv boot.tar boot.tar.md5
echo "Your output file is boot.tar.md5"

