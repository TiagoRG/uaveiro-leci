# To compile all programs, run:
#   make
#
# AED, ua, 2023

CFLAGS += -g -Wall -Wextra

TARGETS = example1

all: $(TARGETS)

example1: example1.o Graph.o SortedList.o

# Dependencies of source files (obtained with gcc -MM)

example1.o: example1.c Graph.h

Graph.o: Graph.c Graph.h SortedList.h

SortedList.o: SortedList.c SortedList.h

clean:
	rm -f *.o
	rm -f $(TARGETS)


