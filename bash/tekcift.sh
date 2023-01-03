#!/bin/bash

read -p "bir sayı giriniz:" sayi
kalan=$(($sayi%2))

if [ $kalan -eq 0 ]; then
	echo "$sayi çift sayıdır"
else
	echo "$sayi tek sayıdır"
fi
