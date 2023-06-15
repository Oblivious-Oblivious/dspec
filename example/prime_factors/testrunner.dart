import "package:dspec/dspec.dart";

import "PrimeFactors.spec.dart";

main() {
    var s = Spec([
        PrimeFactorsSpec(),
    ]);
    s.run_spec_suite(type: "all");
}
