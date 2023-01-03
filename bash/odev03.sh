#!/bin/bash

echo "Hoşgeldiniz"
echo "Profesör iseniz          [1]"
echo "Doçent iseniz            [2]"
echo "Dr. Öğretim Üyesi iseniz [3]"
echo "Öğretim Görevlisi iseniz [4]"
read -p "Ünvan seçiniz :  " unvan
read -p "Kaç saat ders verdiniz :  " saat

if [ $unvan == "1" ]; then
	ucret=$(echo "scale=2; ((200*$saat));"|bc -l)
elif [ $unvan == "2" ]; then
        ucret=$(echo "scale=2; ((170*$saat));"|bc -l)
elif [ $unvan == "3" ]; then
        ucret=$(echo "scale=2; ((150*$saat));"|bc -l)
elif [ $unvan == "4" ]; then
        ucret=$(echo "scale=2; ((80*$saat));"|bc -l)
fi

echo "Alacağınız ücret: $ucret"
