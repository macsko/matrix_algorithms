#!/bin/bash

source utils/paths.sh

# matrix-type nxx, pxx, rxx [output-file]
ARGC=5

RC_BAD_ARGC=1
RC_BAD_ARG=2
RC_SUCCESS=0

USAGE="./generate-matrix.sh (octave|cpp) matrix-type nxx pxx rxx [output-file-name]"

if [[ ($# -ne $ARGC) && ($# -ne $(( ARGC + 1 ))) ]]; then
	echo "Bad arg count. Expected $ARGC or $(( ARGC + 1 )). Received: $#"
	echo $USAGE
	exit $RC_BAD_ARGC
fi

if [[ $1 == "octave" ]]; then
	generator=${__octave_generator__}
elif [[ $1 == "cpp" ]]; then
	generator=${__cpp_generator__}

	if [[ ! -f ${__cpp_generator__} ]]; then
		curr_dir=$(pwd)
		cd ${__cpp_dir__}
		./${__cpp_generator_buildscript_name__}
		cd ${curr_dir}
	fi
else
	echo "Unknown matrix generation script type"
	exit $RC_BAD_ARG
fi

if [[ $2 == "iga" ]]; then
	matrix_type=0
elif [[ $2 == "fem" ]]; then
	matrix_type=1
elif [[ $2 == "riga" ]]; then
	matrix_type=2
else
	echo "Unknown matrix type: $2"
	exit $RC_BAD_ARG
fi


nxx=$3
pxx=$4
rxx=$5

matrix_size=$(python ./${__resolve_matrix_size__} $2 $nxx $pxx)

echo "riga=$matrix_type ($2)"
echo "nxx=$nxx"
echo "pxx=$pxx"
echo "rxx=$rxx"

output_file=
if [[ $# -eq $(( ARGC + 1 )) ]]; then
	output_file=$6
fi

if [[ -z $output_file ]]; then
	./${generator} $matrix_type $nxx $pxx $rxx | sed -En '/\([[:digit:]]+, [[:digit:]]+\) -> .*/p' > ${__default_data_dir__}/$2-${matrix_size}x${matrix_size}.txt
else
	./${generator} $matrix_type $nxx $pxx $rxx | sed -En '/\([[:digit:]]+, [[:digit:]]+\) -> .*/p' > $output_file
fi

exit $RC_SUCCESS
