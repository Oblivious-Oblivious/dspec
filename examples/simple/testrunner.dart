import "package:dspec/dspec.dart";

import "simple.spec.dart";

main() {
    var s = Spec([
        cDataLib(),
        second(),
        third(),
    ]);
    s.run_spec_suite(type: "all");
}
