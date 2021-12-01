#ifndef MATRIX_HPP
#define MATRIX_HPP

#include <iostream>

inline long double abs_(long double value) noexcept {
	return (value >= 0 ? value : -value);
}

inline bool epseq(long double value1, long double value2, long double eps) noexcept {
	return abs_(value1 - value2) <= eps;
}

struct Index{
    int r;
    int c;

    Index(int r, int c){
        this->r = r;
        this->c = c;
    }
};

struct Matrix{
    long double* values;
    int r;
    int c;

    Matrix(int r, int c){
        this->values = new long double[r*c];
        for(int i=0; i<r; i++){
            for(int j=0; j<c; j++){
                values[i*c + j] = 0;
            }
        }

        this->r = r;
        this->c = c;
    }

    Matrix(long double* values, int r, int c){
        this->values = values;
        this->r = r;
        this->c = c;
    }

    long double& operator[](Index index){
        return values[index.r*c + index.c];
    }
};

std::ostream& operator<<(std::ostream& os, Matrix m){
	for(int i=0; i<m.r; i++){
		for(int j=0; j<m.c; j++){
			if(!epseq(m.values[i*m.c + j], 0, 1e-9))
				os << '(' << j + 1  << ", " << i + 1 << ") ->  " << m.values[i * m.c + j] << "\n";
		}
	}
	os << std::endl;
	return os;
}

#endif
