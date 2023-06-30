import "package:dspec/dspec.dart";

import "PrimeFactors.spec.dart";

void main() {
    Spec([
        PrimeFactorsSpec(),
    ]).run_spec_suite(type: "all");
}
