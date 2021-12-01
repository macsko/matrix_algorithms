#! /usr/bin/octave -qf

arg_list = argv();

riga = str2num(arg_list{1});
nxx = str2num(arg_list{2});
pxx = str2num(arg_list{3});
rxx = str2num(arg_list{4});

cd octave

massmatrix(riga, nxx, pxx, rxx);

cd ..
