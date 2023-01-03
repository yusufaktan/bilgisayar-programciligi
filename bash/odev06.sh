
#!/bin/bash

read -p "Birinci öğrencinin not ortalamasını giriniz  : " not1
read -p "İkinci öğrencinin not ortalamasını giriniz   : " not2
read -p "Üçüncü öğrencinin not ortalamasını giriniz   : " not3
read -p "Dördüncü öğrencinin not ortalamasını giriniz : " not4
read -p "Standart sapmayı belirleyiniz : " sapma

notort=$(echo "scale=0;(($not1+$not2+$not3+$not4)/4)"|bc)
ekleort=$(echo "scale=0;(($notort+$sapma))"|bc)
cikarort=$(echo "scale=0;(($notort-$sapma))"|bc)

echo "Sınıfın not ortalaması = $notort"
echo "Standart sapma eklenmiş yeni sınıf ortalaması   = $ekleort"
echo "Standart sapma çıkarılmış yeni sınıf ortalaması = $cikarort"


if ((<=$no)); then
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
