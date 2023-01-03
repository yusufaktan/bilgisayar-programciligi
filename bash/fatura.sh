#!/bin/bash

echo "su faturası:"
read sufatura

echo "elektrik faturası:"
read elkfatura

echo "doğalgaz faturası"
read dgazfatura

let "toplam=$sufatura+$elkfatura+$dgazfatura"
echo "Faturalar toplamı: $toplam"
