#!/bin/bash

read -p "GENÇ misin ? (E/H)" cevap1

if [ $cevap1 == "H" ]; then
	echo "EVDE KAL"
elif [ $cevap1 == "E" ]; then
	echo 'Bağışıklık sistemine güveniyor musun ?'
	read cevap2
if [ $cevap2 == "H" ]; then
	echo "EVDE KAL"
elif [ $cevap2 == "E" ]; then
	echo "SORUMSUZ OLMA, çünkü taşıyıcı olabilirsin"
fi
fi
