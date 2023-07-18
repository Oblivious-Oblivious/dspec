import "SpecData.dart";

import "Object+Equality.dart";
import "StackTrace+Format.dart";
import "String+Colors.dart";

class SpecModule {
    var spacing = "";
    var type = "all";

    var itState = true;
    var failedItResult = "";

    var moduleData = SpecData();
    var beforeEachBlock = () {};
    var afterAachBlock = () {};
    Object? actual;

    void spec_code() {}

    bool _equals(Object? actual, Object? expected) => actual.dspecIfSame(expected);
    bool _not_equals(actual, expected) => !_equals(actual, expected);

    void before(block) => block();
    void before_each(block) => this.beforeEachBlock = block;

    void after(block) => block();
    void after_each(block) => this.afterAachBlock = block;

    void describe(String name, desc) {
        this.spacing += "    ";

        print(this.spacing + "`${name}`".magenta);
        desc();

        this.spacing = this.spacing.substring(0, this.spacing.length - 4);
    }

    void it(String name, it) {
        this.spacing += "    ";
        this.beforeEachBlock();

        this.itState = true;
        this.failedItResult = "";
        var startTime = DateTime.now();
        it();
        var totalTime = DateTime.now().difference(startTime);

        this.moduleData.timeTaken.add(totalTime.inMicroseconds);
        this.moduleData.itCounter++;

        if(this.itState) {
            this.moduleData.positiveItCounter++;

            if(this.type == "all" || this.type == "passing")
                print("${this.spacing}${"✓".green} it $name");
        }
        else if(this.type == "all" || this.type == "failing") {
            print("${this.spacing}${"✗".red} it $name");
            print(this.failedItResult);
        }

        this.afterAachBlock();
        this.spacing = this.spacing.substring(0, this.spacing.length - 4);
    }

    void xit(String name, _) {
        this.spacing += "    ";
        this.beforeEachBlock();

        this.moduleData.xitCounter++;

        if(this.type == "all" || this.type == "skipped")
            print("${this.spacing}- xit ${name} (skipped)".gray);

        this.afterAachBlock();
        this.spacing = this.spacing.substring(0, this.spacing.length - 4);
    }

    void genericMatch(bool matched, errorMessage) {
        if(!matched) {
            this.itState = false;
            this.spacing += "    ";
            this.failedItResult += "${this.spacing}${StackTrace.current.file}:${StackTrace.current.line}:\n";
            this.spacing += "    ";
            this.failedItResult += "${this.spacing} |> ${errorMessage()}\n";
            this.spacing = this.spacing.substring(0, this.spacing.length - 8);
        }
    }

    void iss(expected) =>
        genericMatch(_equals(this.actual, expected), () =>
            "${"`${this.actual}`".red} should be `${expected}`");

    void isnot(expected) =>
        genericMatch(_not_equals(this.actual, expected), () =>
            "${"`${this.actual}`".red} should not be `${expected}`");

    void equals_to(expected) =>
        genericMatch(_equals(this.actual, expected), () =>
            "`${expected}` expected but got ${"`${this.actual}`".red}");

    void does_not_equal_to(expected) =>
        genericMatch(_not_equals(this.actual, expected), () =>
            "`${expected}` must be different from ${"`${this.actual}`".red}");

    void is_true() =>
        genericMatch(this.actual == true, () =>
            "${"`${this.actual}`".red} should be true");

    void is_false() =>
        genericMatch(this.actual == false, () =>
            "${"`${this.actual}`".red} should be false");

    void is_null() =>
        genericMatch(this.actual == null, () =>
            "${"`${this.actual}`".red} should be null");

    void isnot_null() =>
        genericMatch(this.actual != null, () =>
            "${"`${this.actual}`".red} should not be null");

    SpecModule assert_that(actual) {
        this.actual = actual;
        return this;
    }

    void fail(String message) {
        this.itState = false;
        this.spacing += "    ";
        this.failedItResult += "${this.spacing}${StackTrace.current.file}:${StackTrace.current.line}:\n";
        this.spacing += "    ";
        this.failedItResult += "${this.spacing}|> ${message.red}\n";
        this.spacing = this.spacing.substring(0, this.spacing.length - 8);
    }

    SpecData run(String type) {
        this.type = type;

        print("Module `${this.runtimeType.toString()}`".moduleColor);
        spec_code();
        print("");

        return this.moduleData;
    }
}
