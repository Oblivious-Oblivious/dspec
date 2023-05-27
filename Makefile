NAME = dspec

DART = dart
CC = $(DART) run
OPT =
VERSION =

WARNINGS =

INPUT = examples/simple/testrunner.dart

all: compiler

compiler:
	$(CC) $(OPT) $(VERSION) $(WARNINGS) $(INPUT)

clean:
	@echo
