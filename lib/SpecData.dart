import "String+Colors.dart";

class SpecData {
    int it_counter = 0;
    int xit_counter = 0;
    int positive_it_counter = 0;
    var time_taken = <int>[];

    display() {
        print("● ${it_counter + xit_counter} tests".yellow);
        print("✓ ${positive_it_counter} passing".green);
        print("✗ ${it_counter - positive_it_counter} failing".red);
        print("- ${xit_counter} skipped".gray);

        double formatted_time = this.time_taken.fold(0, (acc, next) => acc + next);
        if(formatted_time > 60000000)
            print("★ Finished in ${(formatted_time/60000000).toStringAsFixed(5)} minutes".cyan);
        else if(formatted_time > 1000000)
            print("★ Finished in ${(formatted_time/1000000).toStringAsFixed(5)} seconds".cyan);
        else if(formatted_time > 1000)
            print("★ Finished in ${(formatted_time/1000).toStringAsFixed(5)} ms".cyan);
        else
            print("★ Finished in ${formatted_time.toStringAsFixed(5)} μs".cyan);
    }

    add(SpecData data) {
        this.it_counter += data.it_counter;
        this.xit_counter += data.xit_counter;
        this.positive_it_counter += data.positive_it_counter;
        this.time_taken = data.time_taken;
    }
}
