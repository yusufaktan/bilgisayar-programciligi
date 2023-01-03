#!/bin/bash

echo "1-10 yil (1)"
echo "11-20 yil (2)"
echo "21-30 yil (3)"

read -p "kaç yıllık" yil
read -p "120 saate ek olarak kaç saat" saat

if (( $yil==1 )); then
	ucret=$(echo "scale=2; (((20*$saat)+3000));"|bc -l)
elif (( $yil==2 )); then
	ucret=$(echo "scale=2; (((30*$saat)+4000));"|bc -l)
elif (( $yil==3 )); then
	ucret=$(echo "scale=2; (((40*$saat)+5000));"|bc -l)
fi

echo "ucret = $ucret"
