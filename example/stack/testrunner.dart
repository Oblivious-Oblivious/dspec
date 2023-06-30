import "package:dspec/dspec.dart";

import "Stack.spec.dart";

void main() {
    Spec([
        StackSpec(),
    ]).run_spec_suite(type: "all");
}
