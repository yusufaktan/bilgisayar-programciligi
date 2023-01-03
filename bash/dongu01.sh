#!/bin/bash

while :
do
	echo "1)Üye ekleme"
	echo "2)Üye listeleme"
	echo "3)Üye düzeltme"
	echo "4)Üye silme"
	read -p "Çıkmak için (E/H)" secim
	echo "Seçiminiz: $secim"
	if [ $secim=="E" ];
	then
		break
	fi
done




