import "package:dspec/dspec.dart";

class Something {
    int v;

    Something(this.v);

    @override
    String toString() {
        return "Something:: ${v}";
    }
}

class SimpleTestClass {
    int i = -1;
    double d = 0.0;
    String s = "";

    debug_msg() {
        print("This is called before all tests");
    }
    teardown_msg() {
        print("This is called after all tests");
    }

    initializer() {
        this.i = 1;
        this.d = 2.0;
        this.s = "str";
    }

    destructor() {
        this.i = -1;
        this.d = 0;
        this.s = "";
    }
}

class cDataLib extends SpecModule {
    var s = SimpleTestClass();

    @override
    spec_code() {
        describe("dspec functions", () {
            before(() {
                s.debug_msg();
            });

            before_each(() {
                this.s.initializer();
            });

            after_each(() {
                this.s.destructor();
            });

            it("succeeds `assert_that`", () {
                assert_that(1).iss(1);
            });
            it("fails `assert_that`", () {
                assert_that(1).isnot(1);
            });

            it("succeeds testing an int", () {
                assert_that(1).equals_to(1);
            });
            it("fails testing an int", () {
                assert_that(2).equals_to(3);
            });

            xit("skips that test", () {
                assert_that(42).iss("the meaning of life");
            });

            it("succeeds testing does_not_equal_to", () {
                assert_that(42).does_not_equal_to(41);
            });
            it("fails testing does_not_equal_to", () {
                assert_that(42).does_not_equal_to(42);
            });

            it("succeeds is_null", () {
                assert_that(null).is_null();
            });
            it("fails is_null", () {
                assert_that(42).is_null();
            });

            it("succeeds isnot_null", () {
                assert_that(42).isnot_null();
            });
            it("fails isnot_null", () {
                assert_that(null).isnot_null();
            });

            it("succeeds assert_true", () {
                assert_that(true).is_true();
            });
            it("fails assert_true", () {
                assert_that(false).is_true();
            });

            it("succeeds assert_false", () {
                assert_that(false).is_false();
            });
            it("fails assert_false", () {
                assert_that(true).is_false();
            });

            it("just fails", () {
                fail("This is the fail message");
            });

            after(() {
                s.teardown_msg();
            });
        });
    }
}

class second extends SpecModule {
    @override
    spec_code() {
        describe("DESC 1", () {
            it("before on desc 1", () {
                assert_that(42).isnot(69);
            });

            describe("DESC 2", () {
                describe("DESC 3", () {
                    it("does on 3", () {
                        assert_that(3).iss(3);
                    });
                });
                it("does on 2", () {
                    assert_that(2).iss(2);
                });
            });
            it("does on 1", () {
                assert_that(1).iss(1);
            });
        });

        describe("Array Assertions", () {
            var a = [1,2,3,4,5];
            var b = [7,7,7,7,7];
            var c = [1,2,3,4];

            var aa = [1.1, 2.2, 3.3, 4.4, 5.5];
            var bb = [7.7, 7.7, 7.7, 7.7, 7.7];
            var cc = [1.1, 2.2, 3.3, 4.4];

            var aaa = ["a", "b", "c", "d", "e"];
            var bbb = ["g", "g", "g", "g", "g"];
            var ccc = ["a", "b", "c", "d"];

            it("succeeds testing an int list", () {
                var my_arr = [1,2,3,4,5];
                assert_that(my_arr).equals_to(a);
            });
            it("fails testing an int list", () {
                assert_that(a).equals_to(b);
                assert_that(b).equals_to(c);
            });

            it("succeeds testing a double list", () {
                var my_arr2 = [1.1, 2.2, 3.3, 4.4, 5.5];
                assert_that(my_arr2).equals_to(aa);
            });
            it("fails testing a double list", () {
                assert_that(aa).equals_to(bb);
                assert_that(bb).equals_to(cc);
            });

            it("succeeds testing a string list", () {
                var my_arr3 = ["a", "b", "c", "d", "e"];
                assert_that(my_arr3).equals_to(aaa);
            });
            it("fails testing a string list", () {
                assert_that(aaa).equals_to(bbb);
                assert_that(bbb).equals_to(ccc);
            });
        });
    }
}

class third extends SpecModule {
    @override
    spec_code() {
        describe("BigInt specs", () {
            it("succeeds", () {
                assert_that(BigInt.from(42)).iss(BigInt.from(42));
                assert_that(BigInt.from(42)).equals_to(BigInt.from(42));
            });
            it("fails", () {
                assert_that(BigInt.from(42)).isnot(BigInt.parse("42126133261254124124414657787564576890785864534685316745892312512513252"));
                assert_that(BigInt.from(42)).does_not_equal_to(BigInt.parse("42126133261254124124414657787564576890785864534685316745892312512513252"));
            });
        });

        describe("bool specs", () {
            it("succeeds", () {
                assert_that(true).is_true();
                assert_that(true).iss(true);
                assert_that(true).equals_to(true);
            });
            it("fails", () {
                assert_that(true).isnot(false);
                assert_that(true).does_not_equal_to(false);
            });
        });

        describe("Comparable specs", () {
            it("succeeds", () {
                assert_that(Comparable.compare(42, 42)).iss(Comparable.compare(42, 42));
                assert_that(Comparable.compare(42, 42)).equals_to(Comparable.compare(42, 42));
            });
            it("fails", () {
                assert_that(Comparable.compare(42, 42)).isnot(Comparable.compare(42, 41));
                assert_that(Comparable.compare(42, 42)).does_not_equal_to(Comparable.compare(42, 41));
            });
        });

        describe("DateTime specs", () {
            it("succeeds", () {
                assert_that(DateTime.utc(1989, 11, 9)).iss(DateTime.utc(1989, 11, 9));
                assert_that(DateTime.utc(1989, 11, 9)).equals_to(DateTime.utc(1989, 11, 9));
            });
            it("fails", () {
                assert_that(DateTime.utc(1989, 11, 9)).isnot(DateTime.utc(2089, 11, 9));
                assert_that(DateTime.utc(1989, 11, 9)).does_not_equal_to(DateTime.utc(2089, 11, 9));
            });
        });

        describe("Deprecated specs", () {
            it("succeeds", () {
                assert_that(Deprecated("spec message")).iss(Deprecated("spec message"));
                assert_that(Deprecated("spec message")).equals_to(Deprecated("spec message"));
            });
            it("fails", () {
                assert_that(Deprecated("spec message")).isnot(Deprecated("wrong message"));
                assert_that(Deprecated("spec message")).does_not_equal_to(Deprecated("wrong message"));
            });
        });

        describe("double specs", () {
            it("succeeds", () {
                assert_that(42.17).iss(42.17);
                assert_that(42.17).equals_to(42.17);
            });
            it("fails", () {
                assert_that(42.17).isnot(42.41);
                assert_that(42.17).does_not_equal_to(42.41);
            });
        });

        describe("Duration specs", () {
            it("succeeds", () {
                assert_that(Duration(hours: 2, minutes: 3, seconds: 2)).iss(Duration(hours: 2, minutes: 3, seconds: 2));
                assert_that(Duration(hours: 2, minutes: 3, seconds: 2)).equals_to(Duration(hours: 2, minutes: 3, seconds: 2));
            });
            it("fails", () {
                assert_that(Duration(hours: 2, minutes: 3, seconds: 2)).isnot(Duration(seconds: 41));
                assert_that(Duration(hours: 2, minutes: 3, seconds: 2)).does_not_equal_to(Duration(seconds: 41));
            });
        });

        describe("Expando specs", () {
            it("succeeds", () {
                assert_that(Expando("value")).iss(Expando("value"));
                assert_that(Expando("value")).equals_to(Expando("value"));
            });
            it("fails", () {
                assert_that(Expando("value")).isnot(Expando("v2"));
                assert_that(Expando("value")).does_not_equal_to(Expando("v2"));
            });
        });

        describe("Function specs", () {
            it("succeeds", () {
                assert_that(() {}).iss(() {});
                assert_that(() {}).equals_to(() {});
            });
            it("fails", () {
                assert_that(() {}).isnot((int v) {});
                assert_that(() {}).does_not_equal_to((int v) {});
            });
        });

        describe("int specs", () {
            it("succeeds", () {
                assert_that(42).iss(42);
                assert_that(42).equals_to(42);
            });
            it("fails", () {
                assert_that(42).isnot(41);
                assert_that(42).does_not_equal_to(41);
            });
        });

        describe("List specs", () {
            it("succeeds", () {
                assert_that([1,2,3,4,5]).iss([1,2,3,4,5]);
                assert_that([1,2,3,4,5]).equals_to([1,2,3,4,5]);
            });
            it("fails", () {
                assert_that([1,2,3,4,5]).isnot([1,2]);
                assert_that([1,2,3,4,5]).does_not_equal_to([1,2]);
            });
        });

        describe("Nested List specs", () {
            it("succeeds", () {
                assert_that([[1, 2], 3, [4, [5, 6], 7], 8]).iss([[1, 2], 3, [4, [5, 6], 7], 8]);
                assert_that([[1, 2], 3, [4, [5, 6], 7], 8]).equals_to([[1, 2], 3, [4, [5, 6], 7], 8]);
            });
            it("fails", () {
                assert_that([[1, 2], 3, [4, [5, 6], 7], 8]).isnot([1,2]);
                assert_that([[1, 2], 3, [4, [5, 6], 7], 8]).does_not_equal_to([1,2]);
            });
        });

        describe("Map specs", () {
            it("succeeds", () {
                assert_that({"v1": 1, "v2": 2}).iss({"v1": 1, "v2": 2});
                assert_that({"v1": 1, "v2": 2}).equals_to({"v1": 1, "v2": 2});
            });
            it("fails", () {
                assert_that({"v1": 1, "v2": 2}).isnot({});
                assert_that({"v1": 1, "v2": 2}).does_not_equal_to({});
            });
        });

        describe("Nested Map specs", () {
            it("succeeds", () {
                assert_that({"v1": {}, "v2": {}}).iss({"v1": {}, "v2": {}});
                assert_that({"v1": {}, "v2": {}}).equals_to({"v1": {}, "v2": {}});
            });
            it("fails", () {
                assert_that({"v1": {}, "v2": {}}).isnot({"v1": 1, "v2": 2});
                assert_that({"v1": {}, "v2": {}}).does_not_equal_to({"v1": 1, "v2": 2});
            });
        });

        describe("MapEntry specs", () {
            it("succeeds", () {
                assert_that(MapEntry("v", 42)).iss(MapEntry("v", 42));
                assert_that(MapEntry("v", 42)).equals_to(MapEntry("v", 42));
            });
            it("fails", () {
                assert_that(MapEntry("v", 42)).isnot(MapEntry("v9", 0));
                assert_that(MapEntry("v", 42)).does_not_equal_to(MapEntry("v9", 0));
            });
        });

        describe("Null specs", () {
            it("succeeds", () {
                assert_that(null).iss(null);
                assert_that(null).equals_to(null);
                assert_that(null).is_null();
            });
            it("fails", () {
                assert_that(null).isnot(42);
                assert_that(null).does_not_equal_to(42);
                assert_that(42).isnot_null();
            });
        });

        describe("num specs", () {
            it("succeeds", () {
                assert_that(num.parse("42")).iss(42);
                assert_that(num.parse("42.17")).equals_to(42.17);
            });
            it("fails", () {
                assert_that(num.parse("42")).isnot(123);
                assert_that(num.parse("42.17")).does_not_equal_to(123);
            });
        });

        describe("pragma specs", () {
            it("succeeds", () {
                assert_that(pragma("hint")).iss(pragma("hint"));
                assert_that(pragma("hint")).equals_to(pragma("hint"));
            });
            it("fails", () {
                assert_that(pragma("hint")).isnot(pragma("not hint"));
                assert_that(pragma("hint")).does_not_equal_to(pragma("not hint"));
            });
        });

        describe("RegExp specs", () {
            it("succeeds", () {
                assert_that(RegExp(r"(\w+)")).iss(RegExp(r"(\w+)"));
                assert_that(RegExp(r"(\w+)")).equals_to(RegExp(r"(\w+)"));
            });
            it("fails", () {
                assert_that(RegExp(r"(\w+)")).isnot(RegExp(""));
                assert_that(RegExp(r"(\w+)")).does_not_equal_to(RegExp(""));
            });
        });

        describe("RuneIterator specs", () {
            it("succeeds", () {
                assert_that(RuneIterator("somestring")).iss(RuneIterator("somestring"));
                assert_that(RuneIterator("somestring")).equals_to(RuneIterator("somestring"));
            });
            it("fails", () {
                assert_that(RuneIterator("somestring")).isnot(RuneIterator(""));
                assert_that(RuneIterator("somestring")).does_not_equal_to(RuneIterator(""));
            });
        });

        describe("Runes specs", () {
            it("succeeds", () {
                assert_that(Runes("Dart")).iss(Runes("Dart"));
                assert_that(Runes("Dart")).equals_to(Runes("Dart"));
            });
            it("fails", () {
                assert_that(Runes("Dart")).isnot(Runes(""));
                assert_that(Runes("Dart")).does_not_equal_to(Runes(""));
            });
        });

        describe("Set specs", () {
            it("succeeds", () {
                assert_that(<dynamic>{1, "2", 3.4}).iss(<dynamic>{1, "2", 3.4});
                assert_that(<dynamic>{1, "2", 3.4}).equals_to(<dynamic>{1, "2", 3.4});
            });
            it("fails", () {
                assert_that(<dynamic>{1, "2", 3.4}).isnot(<dynamic>{});
                assert_that(<dynamic>{1, "2", 3.4}).does_not_equal_to(<dynamic>{});
            });
        });

        describe("Nested Set specs", () {
            it("succeeds", () {
                assert_that(<dynamic>{1, {2, {}}, 3, {"4", {"5", "6"}, "7"}, "8"}).iss(<dynamic>{1, {2, {}}, 3, {"4", {"5", "6"}, "7"}, "8"});
                assert_that(<dynamic>{1, {2, {}}, 3, {"4", {"5", "6"}, "7"}, "8"}).equals_to(<dynamic>{1, {2, {}}, 3, {"4", {"5", "6"}, "7"}, "8"});
            });
            it("fails", () {
                assert_that(<dynamic>{1, {2, {}}, 3, {"4", {"5", "6"}, "7"}, "8"}).isnot(<dynamic>{});
                assert_that(<dynamic>{1, {2, {}}, 3, {"4", {"5", "6"}, "7"}, "8"}).does_not_equal_to(<dynamic>{});
            });
        });

        describe("StackTrace specs", () {
            it("succeeds", () {
                assert_that(StackTrace.fromString("function")).iss(StackTrace.fromString("function"));
                assert_that(StackTrace.fromString("function")).equals_to(StackTrace.fromString("function"));
            });
            it("fails", () {
                assert_that(StackTrace.fromString("function")).isnot(StackTrace.fromString(""));
                assert_that(StackTrace.fromString("function")).does_not_equal_to(StackTrace.fromString(""));
            });
        });

        describe("String specs", () {
            it("succeeds", () {
                assert_that("teststr").iss("teststr");
                assert_that("teststr").equals_to("teststr");
            });
            it("fails", () {
                assert_that("teststr").isnot("ok");
                assert_that("teststr").does_not_equal_to("ok");
            });
        });

        describe("StringBuffer specs", () {
            it("succeeds", () {
                assert_that(StringBuffer("teststr")).iss(StringBuffer("teststr"));
                assert_that(StringBuffer("teststr")).equals_to(StringBuffer("teststr"));
            });
            it("fails", () {
                assert_that(StringBuffer("teststr")).isnot(StringBuffer("ok"));
                assert_that(StringBuffer("teststr")).does_not_equal_to(StringBuffer("ok"));
            });
        });

        describe("Symbol specs", () {
            it("succeeds", () {
                assert_that(Symbol("teststr")).iss(Symbol("teststr"));
                assert_that(Symbol("teststr")).equals_to(Symbol("teststr"));
            });
            it("fails", () {
                assert_that(Symbol("teststr")).isnot(Symbol("ok"));
                assert_that(Symbol("teststr")).does_not_equal_to(Symbol("ok"));
            });
        });

        describe("Uri specs", () {
            it("succeeds", () {
                assert_that(Uri(path: "somepath")).iss(Uri(path: "somepath"));
                assert_that(Uri(path: "somepath")).equals_to(Uri(path: "somepath"));
            });
            it("fails", () {
                assert_that(Uri(path: "somepath")).isnot(Uri(path: ""));
                assert_that(Uri(path: "somepath")).does_not_equal_to(Uri(path: ""));
            });
        });

        describe("UriData specs", () {
            it("succeeds", () {
                assert_that(UriData.fromBytes([14, 59, 23, 42])).iss(UriData.fromBytes([14, 59, 23, 42]));
                assert_that(UriData.fromBytes([14, 59, 23, 42])).equals_to(UriData.fromBytes([14, 59, 23, 42]));
            });
            it("fails", () {
                assert_that(UriData.fromBytes([14, 59, 23, 42])).isnot(UriData.fromBytes([14]));
                assert_that(UriData.fromBytes([14, 59, 23, 42])).does_not_equal_to(UriData.fromBytes([14]));
            });
        });
    }
}
