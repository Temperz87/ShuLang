CC = g++
CPPFLAGS = -Iinclude -MMD -MP
RM = rm

OBJECTS = driver/driver.o parser/parser.o tokenizer/tokenizer.o
DEPS := $(OBJECTS:.o=.d)

.PHONY: build clean

%.o : %.cpp
	$(CC) $(CPPFLAGS) $< -c -o $@ 

build: $(OBJECTS)
	$(CC) $(CPPFLAGS) $(OBJECTS) -o ./output/ShuC.out

clean:
	$(RM) -f ./output/*
	$(RM) -f ShuC.out
	$(RM) -f $(OBJECTS)
	$(RM) -f $(DEPS)

-include $(DEPS)