extension Formatting on StackTrace {
    List<String> retrieve_file_info() {
        var frames = this.toString();
        var index_of_filename = frames.indexOf(RegExp("[A-Za-z]+.spec.dart"));
        var file_info = frames.substring(index_of_filename);
        return file_info.split(':');
    }

    String get file => retrieve_file_info()[0];
    String get line => retrieve_file_info()[1];
}
