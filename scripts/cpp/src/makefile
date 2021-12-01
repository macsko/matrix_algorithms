.PHONY: clean cleanall

.DEFAULT_TARGET: build


BUILD_DIR=../build
OUT_DIR=../out

CFLAGS=-O3 --std=c++17
LFLAGS=-O3 --std=c++17


build: gen.o
	g++ $(LFLAGS) $(BUILD_DIR)/gen.o -o $(OUT_DIR)/gen


gen.o: gen.cpp gen.hpp
	g++ $(CFLAGS) -c gen.cpp -o $(BUILD_DIR)/gen.o


clean:
	rm -frv $(BUILD_DIR)/*.o


cleanall:
	rm -frv $(BUILD_DIR)/* $(OUT_DIR)/*