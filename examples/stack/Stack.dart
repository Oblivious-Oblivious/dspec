class Stack {
    late List<int?> S;
    late int N;

    Stack(int max_n) {
        S = List<int?>.filled(max_n, null, growable: false);
        N = 0;
    }

    is_empty() => N == 0;

    push(int? item) => S[N++] = item;

    int? pop() {
        if(N > 0) {
            N--;
            var item = S[N];
            S[N] = null;
            return item;
        }
        else {
            return null;
        }
    }
}
