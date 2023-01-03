#!/bin/bash

read -p "yaşınızı giriniz:" yas

if [ $yas -eq 18 ]; then
	echo "ehliyet alabilirsin"
elif [ $yas -eq 17 ]; then
	echo "gelecek yıl ehliyet alabilirsin"
elif [ $yas -lt 17 ]; then
	echo "yaşınız çok küçük, ehliyet alamazsınız"
elif [ $yas -gt 18 ]; then
	echo "yaşınız 18'den büyük, ehliyet alabilirsiniz"
fi
