import "package:dspec/dspec.dart";

import "PrimeFactors.dart";

class PrimeFactorsSpec extends SpecModule {
    var o = FactorsClass();

    @override spec_code() {
        describe("Find prime factors of integer", () {
            before_each(() {
                this.o = FactorsClass();
            });

            it("finds the factors of 1", () {
                var f1 = this.o.factors_of(1);
                assert_that(f1.length).equals_to(0);
            });

            it("finds the factors of 2", () {
                var f2 = this.o.factors_of(2);
                assert_that(f2[0]).equals_to(2);
            });

            it("finds the factors of 3", () {
                var f3 = this.o.factors_of(3);
                assert_that(f3[0]).equals_to(3);
            });

            it("finds the factors of 4", () {
                var f4 = this.o.factors_of(4);

                assert_that(f4[0]).equals_to(2);
                assert_that(f4[1]).equals_to(2);
            });

            it("finds test factor of 2*2*3*3*5*7*11*11*13", () {
                var f = this.o.factors_of(2*2*3*3*5*7*11*11*13);
                var expected = [2,2,3,3,5,7,11,11,13];
                assert_that(f).equals_to(expected);
            });
        });
    }
}
