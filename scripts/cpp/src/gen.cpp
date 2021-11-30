#include <iostream>
#include <string>
#include "gen.hpp"

int main(int argc, char * argv[]) {
	if (argc != 5) {
		throw std::length_error("Invalid number of arguments passed to script!");
	}

	int riga = std::stoi(std::string(argv[1]), nullptr, 10);
	int nxx  = std::stoi(std::string(argv[2]), nullptr, 10);
	int pxx  = std::stoi(std::string(argv[3]), nullptr, 10);
	int rxx  = std::stoi(std::string(argv[4]), nullptr, 10);

	std::cout << gen(riga, nxx, pxx, rxx);
	return 0;
}