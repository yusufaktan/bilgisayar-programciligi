#!/bin/bash


declare -a ogrenci1
ogrenci1=(OGUZHAN TAS 30 40 50)
toplam1=0

declare -a ogrenci2
ogrenci2=(SINAN CAN 10 20 30)
toplam2=0

declare -a ogrenci3
ogrenci3=(ERHAN SEN 40 50 60)
toplam3=0

declare -a ogrenci4
ogrenci4=(SADIK SEZ 90 100 90)
toplam4=0

declare -a ogrenci5
ogrenci5=(ESRA SON 50 60 80)
toplam5=0


for i in ${ogrenci1[@]}
do
	toplam1=$(($toplam1+$i))
done

ortalama1=$(echo "scale=2; $toplam1/3;"|bc)
echo "${ogrenci1[@]:0:2} $ortalama1"


for i in ${ogrenci2[@]}
do
        toplam2=$(($toplam2+$i))
done

ortalama2=$(echo "scale=2; $toplam2/3;"|bc)
echo "${ogrenci2[@]:0:2} $ortalama2"


for i in ${ogrenci3[@]}
do
        toplam3=$(($toplam3+$i))
done

ortalama3=$(echo "scale=2; $toplam3/3;"|bc)
echo "${ogrenci3[@]:0:2} $ortalama3"


for i in ${ogrenci4[@]}
do
        toplam4=$(($toplam4+$i))
done

ortalama4=$(echo "scale=2; $toplam4/3;"|bc)
echo "${ogrenci4[@]:0:2} $ortalama4"


for i in ${ogrenci5[@]}
do
        toplam5=$(($toplam5+$i))
done

ortalama5=$(echo "scale=2; $toplam5/3;"|bc)
echo "${ogrenci5[@]:0:2} $ortalama5"


echo "${ogrenci1[@]:0:2} $ortalama1">>sonuc.txt
echo "${ogrenci2[@]:0:2} $ortalama2">>sonuc.txt
echo "${ogrenci3[@]:0:2} $ortalama3">>sonuc.txt
echo "${ogrenci4[@]:0:2} $ortalama4">>sonuc.txt
echo "${ogrenci5[@]:0:2} $ortalama5">>sonuc.txt

