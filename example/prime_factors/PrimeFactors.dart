class FactorsClass {
    List<int> factors_of(int remainder) {
        var factors = <int>[];
        var divisor = 2;

        while(remainder > 1) {
            while(remainder % divisor == 0) {
                factors.add(divisor);
                remainder ~/= divisor;
            }
            divisor++;
        }

        return factors;
    }
}
