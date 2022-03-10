/// Sorts an array of strings
///
/// [ascendingSize] if true size groups will be from smallest to largest, else largest to smallest
///
/// [subOrderAlphabetical] if true, sub order will be aA -> zZ else, will be zZ -> aA
List<String> sortStrings(
  List<String> unsortedStrings, {
  required bool ascendingSize,
  required bool subOrderAlphabetical,
}) {
  // Group all strings that have the same length into sub lists
  Map<int, List<String>> lengthGroups = {};
  for (var _string in unsortedStrings) {
    int _stringLength = _string.length;
    if (lengthGroups[_stringLength] == null) {
      lengthGroups[_stringLength] = [];
    }
    lengthGroups[_stringLength]!.add(_string);
  }

  // sort lengths of sub lists
  var _sortedStringLengths = lengthGroups.keys.toList()
    ..sort(((a, b) => a.compareTo(b)));

  // sort sub lists in alphabetical order
  for (var _stringLength in _sortedStringLengths) {
    lengthGroups[_stringLength]!.sort(((a, b) => a.compareTo(b)));
  }

  // spread sorted sub lists into main list
  var _sortedStrings = [
    for (var _stringLength in _sortedStringLengths)
      ...?lengthGroups[_stringLength],
  ];

  return _sortedStrings;
}
