extension Formatting on StackTrace {
    List<String> retrieveFileInfo() {
        var frames = this.toString();
        var indexOfFilename = frames.indexOf(RegExp("[A-Za-z]+.spec.dart"));
        var fileInfo = frames.substring(indexOfFilename);
        return fileInfo.split(':');
    }

    String get file => retrieveFileInfo()[0];
    String get line => retrieveFileInfo()[1];
}
