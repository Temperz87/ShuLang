CC = g++
CPPFLAGS = -Iinclude -MMD -MP -g -Wall
RM = rm

OBJECTS = driver/driver.o parser/parser.o tokenizer/tokenizer.o \
		  ast/shulang_ast.o ast/shuir_ast.o \
		  passes/ShuLangPrinter.o passes/Uniquification.o passes/RemoveComplexOperands.o 

DEPS := $(OBJECTS:.o=.d)

.PHONY: build clean

%.o : %.cpp
	$(CC) $(CPPFLAGS) $< -c -o $@ 

./output/ShuC.out: $(OBJECTS)
	$(CC) $(CPPFLAGS) $(OBJECTS) -o ./output/ShuC.out

build: ./output/ShuC.out

clean:
	$(RM) -f ./output/*
	$(RM) -f ShuC.out
	$(RM) -f $(OBJECTS)
	$(RM) -f $(DEPS)

test: ./output/ShuC.out
	python3 ../test-cases/run.py ../test-cases/phase_1_programs

-include $(DEPS)