CC = g++
CPPFLAGS = -Iinclude -MMD -MP -g -Wall -pedantic
RM = rm

OBJECTS = parser/parser.o tokenizer/tokenizer.o \
		  ast/shulang_ast.o ast/shuir_ast.o \
		  passes/ShuLangPrinter.o passes/Uniquification.o passes/RemoveComplexOperands.o 

DRIVER = ./driver/driver.o

DEPS := $(OBJECTS:.o=.d)

.PHONY: build clean

%.o : %.cpp
	$(CC) $(CPPFLAGS)  -fPIC $< -c -o $@ 

./output/ShuLang.dll: $(OBJECTS)
	$(CC) $(CPPFLAGS) $(OBJECTS) -shared -o ./output/ShuLang.dll

./output/ShuC.out: ./output/ShuLang.dll $(DRIVER)
	$(CC) $(CPPFLAGS) $(DRIVER) ./output/ShuLang.dll -o ./output/ShuC.out

build: ./output/ShuC.out

clean:
	$(RM) -f ./output/*
	$(RM) -f ShuC.out
	$(RM) -f $(OBJECTS)
	$(RM) -f $(DEPS)

test: ./output/ShuC.out
	python3 ../test-cases/run.py ../test-cases/phase_1_programs

-include $(DEPS)