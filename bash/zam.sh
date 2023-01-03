#!/bin/bash

read -p "alınan maaş:" maas
read -p "zam oranı:" zam

zamoran=$(echo "scale=2;($maas*$zam)/100.0;"|bc)
echo "yapılacak zam:$zamoran"

yenimaas=$(echo "scale=2;($maas+$zamoran);"|bc)
echo "yeni maaş:$yenimaas"
