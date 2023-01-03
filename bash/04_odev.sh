#!/bin/bash

notlar=( `cat "ogrencinotlar.txt" `)

toplam1=$(echo "scale=2;${notlar[2]}+${notlar[3]}+${notlar[4]};"|bc)
ogrenci1=$(echo "scale=2; $toplam1/3;"|bc)
echo "${notlar[0]} ${notlar[1]} $ogrenci1">>sonuc.txt

toplam2=$(echo "scale=2;${notlar[7]}+${notlar[8]}+${notlar[9]};"|bc)
ogrenci2=$(echo "scale=2; $toplam2/3;"|bc)
echo "${notlar[5]} ${notlar[6]} $ogrenci2">>sonuc.txt

toplam3=$(echo "scale=2;${notlar[12]}+${notlar[13]}+${notlar[14]};"|bc)
ogrenci3=$(echo "scale=2; $toplam3/3;"|bc)
echo "${notlar[10]} ${notlar[11]} $ogrenci3">>sonuc.txt

toplam4=$(echo "scale=2;${notlar[17]}+${notlar[18]}+${notlar[19]};"|bc)
ogrenci4=$(echo "scale=2; $toplam4/3;"|bc)
echo "${notlar[15]} ${notlar[16]} $ogrenci4">>sonuc.txt

toplam5=$(echo "scale=2;${notlar[22]}+${notlar[23]}+${notlar[24]};"|bc)
ogrenci5=$(echo "scale=2; $toplam5/3;"|bc)
echo "${notlar[20]} ${notlar[21]} $ogrenci5">>sonuc.txt


