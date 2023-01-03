#!/bin/bash

read -p "notunuzu giriniz:   " not

if ((85<=$not && $not<=100)); then
	echo "AA"
elif ((80<=$not && $not<85)); then
	echo "BA"
elif ((70<=$not && $not<80)); then
	echo "BB"
elif ((60<=$not && $not<70)); then
	echo "CB"
elif ((50<=$not && $not<60)); then
	echo "CC"
elif ((45<=$not && $not<50)); then
	echo "DC"
elif ((40<=$not && $not<45)); then
	echo "DD"
elif ((0<=$not && $not<40)); then
	echo "FF"
else
	echo "Hatalı giriş yaptınız"


fi
