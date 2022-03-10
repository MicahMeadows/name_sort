extension UtilExtensions on String {
  /// Allows for splitting string into arrow with multiple delimeters
  List<String> multiSplit(Iterable<String> delimeters) {
    if (delimeters.isEmpty) return [this];
    if (delimeters.length == 1) return split(delimeters.first);

    final next = delimeters.skip(1);
    return split(delimeters.first).expand((i) => i.multiSplit(next)).toList();
  }
}
