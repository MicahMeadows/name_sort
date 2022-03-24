import 'dart:io';

import 'package:name_sort/common/util_extensions.dart';
import 'package:name_sort/input/i_name_input_strategy.dart';

class StdNameInputStrategy implements INameInputStrategy {
  @override
  Future<List<String>> getAllNames() {
    stdout.write('~ Enter list of strings to sort.\n');

    var inputString = stdin.readLineSync() ?? '';

    List<String> namesList = inputString.multiSplit(['\n', ',', ' ']);

    return Future.value(namesList);
  }

  @override
  final String description = 'Standard input';
}
