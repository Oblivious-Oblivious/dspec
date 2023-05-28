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

prime:
	$(CC) $(OPT) $(VERSION) $(WARNINGS) examples/prime_factors/testrunner.dart

stack:
	$(CC) $(OPT) $(VERSION) $(WARNINGS) examples/stack/testrunner.dart

clean:
	@echo
