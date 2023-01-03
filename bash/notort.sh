#!/bin/bash

read -p "birinci vize notu:" vize1
read -p "ikinci vize notu:" vize2
read -p "final notu:" final
read -p "proje notu:" proje

avize=$(echo "scale=2;((((($vize1+$vize2)/2)*30)/100));"|bc)
afinal=$(echo "scale=2;(($final*40)/100);"|bc)
aproje=$(echo "scale=2;(($proje*30)/100);"|bc)

ortalama=$(echo "scale=2;(($avize+$afinal+$aproje));"|bc)
echo "ortalama: $ortalama"
