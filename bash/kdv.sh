#!/bin/bash

read -p "Alış fiyatı:" alis
read -p "KDV oranı:" kdvoran

kdv=$(echo "scale=2;($alis*$kdvoran)/100.0;"|bc)
echo "ödenecek KDV:$kdv"

satis=$(echo "scale=2;$alis+$kdv;"|bc)
echo "satis fiyatı:$satis"
