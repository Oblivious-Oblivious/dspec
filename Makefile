NAME = dspec

DART = dart
CC = $(DART) run
OPT =
VERSION =

WARNINGS =

INPUT = example/simple/testrunner.dart

all: compiler

compiler:
	$(CC) $(OPT) $(VERSION) $(WARNINGS) $(INPUT)

prime:
	$(CC) $(OPT) $(VERSION) $(WARNINGS) example/prime_factors/testrunner.dart

stack:
	$(CC) $(OPT) $(VERSION) $(WARNINGS) example/stack/testrunner.dart

clean:
	@echo
