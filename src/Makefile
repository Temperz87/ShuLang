CC = clang++
CPPFLAGS = -Iinclude -MMD -g -Wall -pedantic $(shell llvm-config --cxxflags) $(shell llvm-config --libs)
PYTHONFLAGS = -O3 -Wall -shared -fPIC $(shell python3 -m pybind11 --include) -Iinclude
RM = rm

OBJECTS = parser/parser.o tokenizer/tokenizer.o type_checker/TypeChecker.o \
		  ast/shulang_ast.o ast/shuir_ast.o \
		  Visitors/LLVMCodegenVisitor.o Visitors/ShuLangPrinter.o \
		  passes/Uniquification.o passes/RemoveComplexOperands.o  \
		  passes/SelectInstructions.o passes/LLVMSelection.o

DRIVER = ./driver/driver.o

DEPS := $(OBJECTS:.o=.d) ./driver/driver.d ./python_binding/pybind11_stuff.d

.PHONY: build clean python

./driver/driver.o: $(OBJECTS)
	$(CC) $(CPPFLAGS) ./driver/driver.cpp -c -o ./driver/driver.o

%.o : %.cpp
	$(CC) $(CPPFLAGS) -fPIC $< -c -o $@ 

./output/ShuC.out: ./driver/driver.o
	touch ./output/ShuC.out
	$(CC) $(CPPFLAGS) $(OBJECTS)  ./driver/driver.o -o ./output/ShuC.out


./python_bindings/pybind11_stuff.o: $(OBJECTS)
	$(CC) $(CPPFLAGS) $(PYTHONFLAGS) -fPIC ./python_bindings/pybind11_stuff.cpp -c -o ./python_bindings/pybind11_stuff.o

build: ./output/ShuC.out

# Makes the python testing bindings
python: $(OBJECTS)
	$(CC) $(PYTHONFLAGS) $(shell llvm-config --libs) $(OBJECTS)  ./python_bindings/pybind11_stuff.cpp -shared -o ../test-cases/shulang$(shell python3-config --extension-suffix)

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