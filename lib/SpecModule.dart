import "SpecData.dart";

import "Object+Equality.dart";
import "StackTrace+Format.dart";
import "String+Colors.dart";

class SpecModule {
    var spacing = "";
    var type = "all";

    var it_state = true;
    var failed_it_result = "";

    var module_data = SpecData();
    var before_each_block = () {};
    var after_each_block = () {};
    Object? actual;

    void spec_code() {}

    bool _equals(Object? actual, Object? expected) => actual.dspec_if_same(expected);
    bool _not_equals(actual, expected) => !_equals(actual, expected);

    void before(block) => block();
    void before_each(block) => this.before_each_block = block;

    void after(block) => block();
    void after_each(block) => this.after_each_block = block;

    void describe(String name, desc) {
        this.spacing += "    ";

        print(this.spacing + "`${name}`".magenta);
        desc();

        this.spacing = this.spacing.substring(0, this.spacing.length - 4);
    }

    void it(String name, it) {
        this.spacing += "    ";
        this.before_each_block();

        this.it_state = true;
        this.failed_it_result = "";
        var start_time = DateTime.now();
        it();
        var total_time = DateTime.now().difference(start_time);

        this.module_data.time_taken.add(total_time.inMicroseconds);
        this.module_data.it_counter++;

        if(this.it_state) {
            this.module_data.positive_it_counter++;

            if(this.type == "all" || this.type == "passing")
                print("${this.spacing}${"✓".green} it $name");
        }
        else if(this.type == "all" || this.type == "failing") {
            print("${this.spacing}${"✗".red} it $name");
            print(this.failed_it_result);
        }

        this.after_each_block();
        this.spacing = this.spacing.substring(0, this.spacing.length - 4);
    }

    void xit(String name, _) {
        this.spacing += "    ";
        this.before_each_block();

        this.module_data.xit_counter++;

        if(this.type == "all" || this.type == "skipped")
            print("${this.spacing}- xit ${name} (skipped)".gray);

        this.after_each_block();
        this.spacing = this.spacing.substring(0, this.spacing.length - 4);
    }

    void generic_match(bool matched, error_message) {
        if(!matched) {
            this.it_state = false;
            this.spacing += "    ";
            this.failed_it_result += "${this.spacing}${StackTrace.current.file}:${StackTrace.current.line}:\n";
            this.spacing += "    ";
            this.failed_it_result += "${this.spacing} |> ${error_message()}\n";
            this.spacing = this.spacing.substring(0, this.spacing.length - 8);
        }
    }

    void iss(expected) =>
        generic_match(_equals(this.actual, expected), () =>
            "${"`${this.actual}`".red} should be `${expected}`");

    void isnot(expected) =>
        generic_match(_not_equals(this.actual, expected), () =>
            "${"`${this.actual}`".red} should not be `${expected}`");

    void equals_to(expected) =>
        generic_match(_equals(this.actual, expected), () =>
            "`${expected}` expected but got ${"`${this.actual}`".red}");

    void does_not_equal_to(expected) =>
        generic_match(_not_equals(this.actual, expected), () =>
            "`${expected}` must be different from ${"`${this.actual}`".red}");

    void is_true() =>
        generic_match(this.actual == true, () =>
            "${"`${this.actual}`".red} should be true");

    void is_false() =>
        generic_match(this.actual == false, () =>
            "${"`${this.actual}`".red} should be false");

    void is_null() =>
        generic_match(this.actual == null, () =>
            "${"`${this.actual}`".red} should be null");

    void isnot_null() =>
        generic_match(this.actual!= null, () =>
            "${"`${this.actual}`".red} should not be null");

    SpecModule assert_that(actual) {
        this.actual = actual;
        return this;
    }

    void fail(String message) {
        this.it_state = false;
        this.spacing += "    ";
        this.failed_it_result += "${this.spacing}${StackTrace.current.file}:${StackTrace.current.line}:\n";
        this.spacing += "    ";
        this.failed_it_result += "${this.spacing}|> ${message.red}\n";
        this.spacing = this.spacing.substring(0, this.spacing.length - 8);
    }

    SpecData run(String type) {
        this.type = type;

        print("Module `${this.runtimeType.toString()}`".module_color);
        spec_code();
        print("");

        return this.module_data;
    }
}
