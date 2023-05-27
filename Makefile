NAME = dspec

DART = dart
CC = $(DART) run
OPT =
VERSION =

WARNINGS =

INPUT = example/dspec_example.dart

all: compiler

compiler:
	$(CC) $(OPT) $(VERSION) $(WARNINGS) $(INPUT)

clean:
	@echo
