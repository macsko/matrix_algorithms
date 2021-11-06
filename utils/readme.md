# Matrix generation

Usage: 

```
./generate-matrix.sh riga nxx pxx rxx > output-file-name.txt
```

where for:

* **IGA**:
	* $riga = 0$
	* $nxx \ge 2$
	* $pxx \in [2, 3, 4]$
	* $rxx = 0$

* **FEM**:
	* $riga = 1$
	* $nxx \ge 2$
	* $pxx \in [2, 3, 4]$
	* $rxx = 0$

* **rIGA**:
	* $riga = 2$
	* $nxx \ge 2$
	* $pxx \in [2, 3, 4]$
	* $rxx$ divides $nxx$


## Matrix size

[Docs say](https://upel2.cel.agh.edu.pl/wiet/pluginfile.php/103424/mod_resource/content/1/Opis%20mass_matrix.pdf) final 
matix size should be $(nxx + pxx)^2$ (however it does not work AFAIK xD).


## Naming convention

The file with matrx representation, to be seen in notebook, should be located in `/output` directory and named as follows:

```
<matrix-type><width>x<height>.txt
```
