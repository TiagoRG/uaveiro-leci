# To compile all programs, run:
#   make
#
# AED, ua, 2023

CFLAGS += -g -Wall -Wextra

TARGETS = example1 example2

all: $(TARGETS)

example1: example1.o Graph.o SortedList.o

example2: example2.o Graph.o GraphDFSRec.o IntegersStack.o SortedList.o

# Dependencies of source files (obtained with gcc -MM)

example1.o: example1.c Graph.h

example2.o: example2.c Graph.h GraphDFSRec.h

Graph.o: Graph.c Graph.h SortedList.h

GraphDFSRec.o: GraphDFSRec.c GraphDFSRec.h IntegersStack.h

IntegersStack.o: IntegersStack.c IntegersStack.h

SortedList.o: SortedList.c SortedList.h

clean:
	rm -f *.o
	rm -f $(TARGETS)


