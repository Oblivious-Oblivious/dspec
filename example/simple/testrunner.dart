import "package:dspec/dspec.dart";

import "simple.spec.dart";

void main() {
    Spec([
        cDataLib(),
        second(),
        third(),
    ]).run_spec_suite(type: "all");
}
