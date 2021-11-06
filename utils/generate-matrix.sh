#!/bin/bash

# matrix-type nxx, pxx, rxx [output-file]
ARGC=4

RC_BAD_ARGC=1
RC_BAD_ARG=2
RC_SUCCESS=0

USAGE="./generate-matrix.sh matrix-type nxx pxx rxx [output-file-name]"

if [[ ($# -ne $ARGC) && ($# -ne $(( ARGC + 1 ))) ]]; then
	echo "Bad arg count. Expected $ARGC or $(( ARGC + 1 )). Received: $#"
	echo $USAGE
	exit $RC_BAD_ARGC
fi

if [[ $1 == "iga" ]]; then
	matrix_type=0
elif [[ $1 == "fem" ]]; then
	matrix_type=1
elif [[ $1 == "riga" ]]; then
	matrix_type=2
else
	echo "Unknown matrix type: $1"
	exit $RC_BAD_ARG
fi

nxx=$2
pxx=$3
rxx=$4

echo "riga=$matrix_type ($1)"
echo "nxx=$nxx"
echo "pxx=$pxx"
echo "rxx=$rxx"

output_file=
if [[ $# -eq $(( ARGC + 1 )) ]]; then
	output_file=$5
fi

if [[ -z $output_file ]]; then
	./massmatrix-wrapper.m $matrix_type $nxx $pxx $rxx | sed -En '/\([[:digit:]]+, [[:digit:]]+\) -> .*/p'
else
	./massmatrix-wrapper.m $matrix_type $nxx $pxx $rxx | sed -En '/\([[:digit:]]+, [[:digit:]]+\) -> .*/p' > $output_file
fi

exit $RC_SUCCESS
