CC = clang++
CPPFLAGS = -Iinclude -MMD -g -Wall -pedantic $(shell llvm-config --libs) -std=c++20
PYTHONFLAGS = -O3 -Wall -shared -fPIC $(shell python3 -m pybind11 --includes) -Iinclude
RM = rm

OBJECTS = parser/parser.o tokenizer/tokenizer.o type_checker/TypeChecker.o \
		  ast/shulang_ast.o ast/sir_ast.o \
		  Visitors/ComplexDetector.o Visitors/LLVMCodegenVisitor.o Visitors/ShuLangPrinter.o \
		  passes/Uniquification.o passes/ShortCircuitify.o passes/RemoveComplexOperands.o  \
		  passes/SelectInstructions.o passes/PromotePseudoPhi.o passes/LLVMSelection.o

PYTHONFILEPATH = ./output/shulang$(shell python3-config --extension-suffix)

DRIVER = ./driver/driver.o

DEPS := $(OBJECTS:.o=.d) ./driver/driver.d ./python_binding/pybind11_stuff.d

.PHONY: build clean python

./driver/driver.o: $(OBJECTS)
	$(CC) $(CPPFLAGS) ./driver/driver.cpp -c -o ./driver/driver.o

%.o : %.cpp
	$(CC) $(CPPFLAGS) -fPIC $< -c -o $@ 

./output/Shuc: ./driver/driver.o
	touch ./output/Shuc
	$(CC) $(CPPFLAGS) $(OBJECTS) ./driver/driver.o -o ./output/Shuc

./output/shulang$(shell python3-config --extension-suffix): $(OBJECTS)
	touch ./shulang$(shell python3-config --extension-suffix)
	$(CC) $(PYTHONFLAGS) $(shell llvm-config --libs) $(OBJECTS) ./python_bindings/pybind11_stuff.cpp -shared -o $(PYTHONFILEPATH)
	cp $(PYTHONFILEPATH) ../test-cases/shulang$(shell python3-config --extension-suffix)

build: ./output/Shuc $(PYTHONFILEPATH)

clean:
	$(RM) -f ./output/*
	$(RM) -f Shuc
	$(RM) -f ShuLang.dll
	$(RM) -f ShuLangPy.dll
	$(RM) -f $(OBJECTS)
	$(RM) -f $(DEPS)
	$(RM) -f ./driver/driver.d
	$(RM) -f ./driver/driver.o

test: python
	python3 ../test-cases/run.py ../test-cases/phase_1_programs ../test-cases/phase_2_programs

-include $(DEPS)
