#!/bin/bash

read -p "saati giriniz:" saat
echo $saat

if (( $saat>=6 && $saat<=12 )); then
	echo "günaydın"
elif  (( $saat>=12 && $saat<=20 )); then
	echo "tünaydın"
elif (( $saat>=20 && $saat<=24 )); then
	echo "iyi akşamlar"
elif (( $saat>=21 && $saat<=06 )); then
	echo "iyi geceler"
fi



