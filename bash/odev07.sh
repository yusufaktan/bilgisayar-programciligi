#!/bin/bash


YIL="20"
SERMAYE="10000"
ORAN="10"


echo "	YIL		KAZANILAN	TOPLAM"

for i in $(seq 1 1 $YIL) ; do
	let KAZANILAN=$(( $SERMAYE * $ORAN / 100 ))
	echo -n "	$i		$KAZANILAN		"

	let SERMAYE=$(( $SERMAYE + $KAZANILAN  ))
	echo "$SERMAYE"
done
