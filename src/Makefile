CC = g++
CPPFLAGS = -Iinclude
RM = rm

OBJECTS = driver/driver.o parser/parser.o tokenizer/tokenizer.o
HEADERS = $(wildcard ./include/*.hpp)

.PHONY: build clean

include/lib.o:
	$(CC) $(HEADERS) -c -o ./include/lib.o
	

%.o : %.cpp
	$(CC) $(CPPFLAGS) $< -c -o $@ 

build: $(OBJECTS) include/lib.o
	$(CC) $(CPPFLAGS) $(OBJECTS) -o ./output/ShuC.out

clean:
	$(RM) -f ./output/*
	$(RM) -f ShuC.out