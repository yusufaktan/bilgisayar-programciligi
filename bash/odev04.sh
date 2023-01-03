#!/bin/bash

echo "Hoşgeldiniz"
echo "1-5 yıl arası çalışan iseniz   [1]"
echo "6-10 yıl arası çalışan iseniz  [2]"
echo "10-20 yıl arası çalışan iseniz [3]"
echo "20-25 yıl arası çalışan iseniz [4]"
read -p "Kaç yıllık çalışansınız :  " yil
read -p "Kaç saat çalıştınız :  " saat

if [ $yil == "1" ]; then
        ucret=$(echo "scale=2; ((50*$saat+2500));"|bc -l)
elif [ $yil == "2" ]; then
        ucret=$(echo "scale=2; ((75*$saat+2500));"|bc -l)
elif [ $yil == "3" ]; then
        ucret=$(echo "scale=2; ((100*$saat+2500));"|bc -l)
elif [ $yil == "4" ]; then
        ucret=$(echo "scale=2; ((125*$saat+2500));"|bc -l)
fi

echo "Alacağınız ücret: $ucret"


