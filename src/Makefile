CC = g++
CPPFLAGS = -Iinclude -MMD -MP -g
RM = rm

OBJECTS = driver/driver.o parser/parser.o tokenizer/tokenizer.o Visitor/visitor.o
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

-include $(DEPS)