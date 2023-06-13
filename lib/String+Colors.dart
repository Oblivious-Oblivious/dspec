extension Colors on String {
    String get red => "\u001B[1;31m${this}\u001B[0m";
    String get green => "\u001B[38;5;78m${this}\u001B[0m";
    String get yellow => "\u001B[38;5;11m${this}\u001B[0m";
    String get gray => "\u001B[38;5;244m${this}\u001B[0m";
    String get cyan => "\u001B[1;36m${this}\u001B[0m";
    String get magenta => "\u001B[38;5;207m${this}\u001B[0m";
    String get module_color => "\u001B[48;5;89m\u001B[38;5;11m${this}\u001B[0m";
}
