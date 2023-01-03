#!/bin/bash

echo "1)Üye Ekleme"
echo "2)Üye Listeleme"
echo "3)Üye Düzeltme"
echo "4)Üye Silme"
read -p "Çıkmak için (E/H) : " cikis

while :
do

if [ $cikis == "H" ]; then
	echo "1)Üye Ekleme"
	echo "2)Üye Listeleme"
	echo "3)Üye Düzeltme"
	echo "4)Üye Silme"
	read -p "Çıkmak için (E/H) : " cikis
	continue

elif [ $cikis == "E" ]; then
	break

else
	echo "Hatalı giriş yaptınız !"
	break
fi
done
