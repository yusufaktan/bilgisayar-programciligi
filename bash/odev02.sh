
#!/bin/bash

read -p "Yapılan Alışverişin Tutarı ?: " tutar

if (( $tutar<200 && $tutar>=100 )); then
	indirim=$(echo "scale=2; (($tutar*10)/100);"|bc -l)
elif  (( $tutar<300 && $tutar>=200 )); then
        indirim=$(echo "scale=2; (($tutar*15)/100);"|bc -l)
elif (( $tutar<400 && $tutar>=300 )); then
        indirim=$(echo "scale=2; (($tutar*20)/100);"|bc -l)
elif [ $tutar>=400 ]; then
        indirim=$(echo "scale=2; (($tutar*25)/100);"|bc -l)
fi
yenitutar=$(echo "scale=2; (($tutar-$indirim));"|bc)
echo "İndirim miktarı: $indirim"
echo "İndirimli ödenecek tutar: $yenitutar"
