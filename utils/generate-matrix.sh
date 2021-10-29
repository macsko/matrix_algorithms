#!/bin/bash

# riga, nxx, pxx, rxx
ARGC=4

RC_BAD_ARGC=1
RC_SUCCESS=0

if [[ ! $# -eq $ARGC ]]; then
	echo "Bad arg count. Expected $ARGC. Received: $#"
	exit $RC_BAD_ARGC
fi

./massmatrix-wrapper.m $1 $2 $3 $4 | sed -En '/\([[:digit:]]+, [[:digit:]]+\) -> .*/p'

exit $RC_SUCCESS
