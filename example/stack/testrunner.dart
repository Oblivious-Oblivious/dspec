import "package:dspec/dspec.dart";

import "Stack.spec.dart";

main() {
    var s = Spec([
        StackSpec(),
    ]);
    s.run_spec_suite(type: "all");
}
