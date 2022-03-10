import 'dart:convert';
import 'dart:io';

import 'package:name_sort/data/name_repository/i_name_repository.dart';

class FileNameRepository implements INameRepository {
  final String filePath;

  /// Represents a repository of names in a file
  const FileNameRepository(this.filePath);

  /// Represents a repository of names in the asset folder
  factory FileNameRepository.asset(String fileName) {
    return FileNameRepository('asset/$fileName');
  }

  @override
  Future<List<String>> getAllStrings() async {
    var namesTextFile = File(filePath);

    List<String> namesToSort = [];
    await namesTextFile
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .forEach(
      (_textLine) {
        var fixedName = _textLine.trim();
        if (fixedName.isNotEmpty) {
          namesToSort.add(fixedName);
        }
      },
    );

    return namesToSort;
  }
}
