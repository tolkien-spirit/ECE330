all : test_static test_dynamic 

test_static: matrix_static.c test_static.c
	gcc -o test_static test_static.c matrix_static.c - 

test_dynamic: test_dynamic.c matrix_dynamic.c
	gcc -o test_dynamic test_dynamic.c matrix_dynamic.c - 

matrix_dynamic.o: matrix_static.cpp
	gcc -c matrix_dynamic.cpp

matrix_static.o: matrix_static.cpp
	gcc -c matrix_static.cpp

run:  test_static test_dynamic
	
	./test_static
	./test_dynamic

clean: 

rm matrix_dynamic *.o 
rm matrix_static *.o


