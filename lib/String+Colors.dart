extension Colors on String {
    String red() => "\u001B[1;31m${this}\u001B[0m";
    String green() => "\u001B[38;5;78m${this}\u001B[0m";
    String yellow() => "\u001B[38;5;11m${this}\u001B[0m";
    String gray() => "\u001B[38;5;244m${this}\u001B[0m";
    String cyan() => "\u001B[1;36m${this}\u001B[0m";
    String magenta() => "\u001B[38;5;207m${this}\u001B[0m";
    String module_color() => "\u001B[48;5;89m\u001B[38;5;11m${this}\u001B[0m";
}
