CC = g++
CPPFLAGS = -Iinclude -MMD -g -Wall -pedantic
PYTHONFLAGS = -O3 -Wall -shared -fPIC $(shell python3 -m pybind11 --include) -Iinclude
RM = rm

OBJECTS = parser/parser.o tokenizer/tokenizer.o \
		  ast/shulang_ast.o ast/shuir_ast.o \
		  passes/ShuLangPrinter.o passes/Uniquification.o passes/RemoveComplexOperands.o 

DRIVER = ./driver/driver.o

DEPS := $(OBJECTS:.o=.d) ./driver/driver.d ./python_binding/pybind11_stuff.d

.PHONY: build clean python

./python_bindings/pybind11_stuff.o: $(OBJECTS)
	$(CC) $(CPPFLAGS) $(PYTHONFLAGS) -fPIC ./python_bindings/pybind11_stuff.cpp -c -o ./python_bindings/pybind11_stuff.o

./driver/driver.o: $(OBJECTS)
	$(CC) $(CPPFLAGS) ./driver/driver.cpp -c -o ./driver/driver.o

%.o : %.cpp
	$(CC) $(CPPFLAGS) -fPIC $< -c -o $@ 

# Makes the python testing bindings
python: $(OBJECTS)
	$(CC) $(PYTHONFLAGS) $(OBJECTS)  ./python_bindings/pybind11_stuff.cpp -shared -o ../test-cases/shulang$(shell python3-config --extension-suffix)

./output/ShuC.out: ./driver/driver.o
	$(CC) $(CPPFLAGS) $(OBJECTS)  ./driver/driver.o -o ./output/ShuC.out

build: ./output/ShuC.out

clean:
	$(RM) -f ./output/*
	$(RM) -f ShuC.out
	$(RM) -f ShuLang.dll
	$(RM) -f ShuLangPy.dll
	$(RM) -f $(OBJECTS)
	$(RM) -f $(DEPS)
	$(RM) -f ./driver/driver.d
	$(RM) -f ./driver/driver.o

test: python
	python3 ../test-cases/run.py ../test-cases/phase_1_programs

-include $(DEPS)