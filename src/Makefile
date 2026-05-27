CC = clang++
CPPFLAGS = -Iinclude -MMD -g -Wall -pedantic $(shell llvm-config --libs) -std=c++20
PYTHONFLAGS = -O3 -Wall -fPIC $(shell python3 -m pybind11 --includes) -Iinclude -std=c++20
RM = rm

OBJECTS = parser/parser.o tokenizer/tokenizer.o type_checker/TypeChecker.o \
		  ast/shulang_ast.o ast/sir_ast.o \
		  Visitors/ComplexDetector.o Visitors/LLVMCodegenVisitor.o Visitors/ShuLangPrinter.o \
		  Visitors/ShuLangVisitor.o \
		  analysis/SIRSCCP.o analysis/KnownConstant.o analysis/UseDefAnalysis.o analysis/UseDefInfo.o \
		  optimizations/SIRPropagateConstants.o optimizations/SIRFold.o optimizations/SIRDSE.o optimizations/CFGSimplify.o \
		  passes/Uniquification.o passes/ShortCircuitify.o passes/RemoveComplexOperands.o  \
		  passes/SelectInstructions.o passes/PromotePseudoPhi.o passes/LLVMSelection.o

PYTHONFILEPATH = ./output/shulang$(shell python3-config --extension-suffix)

DRIVER = ./driver/driver.o

DEPS := $(OBJECTS:.o=.d) ./driver/driver.d ./python_bindings/pybind11_stuff.d

.PHONY: build clean

./driver/driver.o: $(OBJECTS)
	$(CC) $(CPPFLAGS) ./driver/driver.cpp -c -o ./driver/driver.o

./python_bindings/pybind11_stuff.o:
	$(CC) $(PYTHONFLAGS) ./python_bindings/pybind11_stuff.cpp -MMD -c -o ./python_bindings/pybind11_stuff.o 

$(PYTHONFILEPATH): $(OBJECTS) ./python_bindings/pybind11_stuff.o
	touch $(PYTHONFILEPATH)
	$(CC) $(PYTHONFLAGS) $(shell llvm-config --libs) $(OBJECTS) ./python_bindings/pybind11_stuff.o -shared -o $(PYTHONFILEPATH)
	cp $(PYTHONFILEPATH) ../test-cases/shulang$(shell python3-config --extension-suffix)

%.o : %.cpp
	$(CC) $(CPPFLAGS) -fPIC -fexceptions $< -c -o $@ 

./output/shuc: ./driver/driver.o
	mkdir -p output
	touch ./output/shuc
	$(CC) $(CPPFLAGS) $(OBJECTS) ./driver/driver.o -fexceptions -o ./output/shuc

build: ./output/shuc $(PYTHONFILEPATH)

clean:
	$(RM) -f ./output/*
	$(RM) -f shuc
	$(RM) -f ShuLang.dll
	$(RM) -f ShuLangPy.dll
	$(RM) -f $(OBJECTS)
	$(RM) -f $(DEPS)
	$(RM) -f ./driver/driver.d
	$(RM) -f ./driver/driver.o
	$(RM) -f ./python_bindings/pybind11_stuff.d
	$(RM) -f ./python_bindings/pybind11_stuff.o

-include $(DEPS)
