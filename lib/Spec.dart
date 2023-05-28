import "SpecData.dart";
import "SpecModule.dart";

class Spec {
    var modules = <SpecModule>[];
    var data = SpecData();

    Spec(this.modules);

    run_spec_suite({required String type}) {
        print("\u{001B}[38;5;95m/######### #########/");
        print("\u{001B}[38;5;95m/##### \u{001B}[38;5;89ms\u{001B}[38;5;90mw\u{001B}[38;5;91mi\u{001B}[38;5;92ms\u{001B}[38;5;93mp\u{001B}[38;5;94me\u{001B}[38;5;95mc\u{001B}[0m \u{001B}[38;5;95m#####/");
        print("/######### #########/\u{001B}[0m");
        print("");

        for(var m in this.modules)
            this.data.add(m.run(type));
        data.display();
    }
}
