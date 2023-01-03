#!/bin/bash

read -p "adınızı giriniz:" adi
read -p "soyadınızı giriniz:" soyadi
read -p "numaranızı giriniz:" numara

echo "$adi $soyadi $numara" >>ogrenci.txt
