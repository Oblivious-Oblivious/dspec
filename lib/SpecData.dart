import "String+Colors.dart";

class SpecData {
    int itCounter = 0;
    int xitCounter = 0;
    int positiveItCounter = 0;
    var timeTaken = <int>[];

    void display() {
        print("● ${itCounter + xitCounter} tests".yellow);
        print("✓ ${positiveItCounter} passing".green);
        print("✗ ${itCounter - positiveItCounter} failing".red);
        print("- ${xitCounter} skipped".gray);

        double formattedTime = this.timeTaken.fold(0, (acc, next) => acc + next);
        if(formattedTime > 60000000)
            print("★ Finished in ${(formattedTime/60000000).toStringAsFixed(5)} minutes".cyan);
        else if(formattedTime > 1000000)
            print("★ Finished in ${(formattedTime/1000000).toStringAsFixed(5)} seconds".cyan);
        else if(formattedTime > 1000)
            print("★ Finished in ${(formattedTime/1000).toStringAsFixed(5)} ms".cyan);
        else
            print("★ Finished in ${formattedTime.toStringAsFixed(5)} μs".cyan);
    }

    void add(SpecData data) {
        this.itCounter += data.itCounter;
        this.xitCounter += data.xitCounter;
        this.positiveItCounter += data.positiveItCounter;
        this.timeTaken = data.timeTaken;
    }
}
