TBB_INC=${HOME}/tbb/tbb42_20140601oss/include
TBB_LIB=${HOME}/tbb/tbb42_20140601oss/build/linux_intel64_gcc_cc4.6.3_libc2.14.90_kernel3.6.11_release
TBBFLAGS=-I$(TBB_INC) -Wl,-rpath,$(TBB_LIB) -L$(TBB_LIB)  
GSL_INC=${HOME}/gsl/installpath/include
#GSL_INC=/usr/share/doc
GSL_LIB=${HOME}/gsl/installpath/lib
#GSL_LIB=/usr/share/doc/libgsl0ldbl
GSLFLAGS=-I$(GSL_INC) -Wl,-rpath,$(GSL_LIB) -L$(GSL_LIB) -lgsl -lgslcblas -lm
JEMALLOC_INC=${HOME}/jemalloc/installpath/include
JEMALLOC_LIB=${HOME}/jemalloc/installpath/lib
JEMALLOCFLAGS=-I$(JEMALLOC_INC) -Wl,-rpath,$(JEMALLOC_LIB) -L$(JEMALLOC_LIB) -ljemalloc
CC=g++
CFLAGS= -O3 -lrt -pthread -std=gnu++0x -march=native 
SRC= ./src/TestLockFree.cpp
OBJ= ./bin/lockFreeIbst.o
EXEC = Test 
all: 
	$(CXX) $(CFLAGS) $(TBBFLAGS) $(JEMALLOCFLAGS) -o $(OBJ) $(SRC) $(GSLFLAGS) 
clean:
	rm -rf ./bin/*.*
