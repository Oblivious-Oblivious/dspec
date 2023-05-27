import "package:dspec/dspec.dart";

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

        internalstuff();
    }
}