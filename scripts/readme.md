# Matrix generation

Usage: 

```
./generate-matrix.sh matrix-type nxx pxx rxx [output-file-name]
```

where **matrix-type** is one of:

* **iga**, then:
	* $riga = 0$
	* $nxx \ge 2$
	* $pxx \in [2, 3, 4]$
	* $rxx = 0$

* **fem**, then:
	* $riga = 1$
	* $nxx \ge 2$
	* $pxx \in [2, 3, 4]$
	* $rxx = 0$

* **riga**, then:
	* $riga = 2$
	* $nxx \ge 2$
	* $pxx \in [2, 3, 4]$
	* $rxx$ divides $nxx$


## Matrix size

* **IGA**

	$(nxx + pxx)^2$ x $(nxx + pxx)^2$

* **FEM**

	$(2 * nxx + pxx - 1)^2$ x $(2 * nxx + pxx - 1)^2$

## Naming convention

The file with matrx representation, to be seen in notebook, should be located in `/output` directory and named as follows:

```
<matrix-type>-<width>x<height>.txt
```
