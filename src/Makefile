CC = g++

build:
	$(CC) driver/driver.cpp -c -o output/driver.o -Iinclude
	$(CC) tokenizer/tokenizer.cpp -c -o output/tokenizer.o -Iinclude
	$(CC) parser/parser.cpp -c -o output/parser.o -Iinclude
	$(CC) output/*.o -o ShuC.out -Iinclude
