import 'dart:io';

import 'package:name_sort/output/i_list_output_strategy.dart';

/// Output strategy capable of outputting objects to the std console
class StdOutputStrategy implements IListOutputStrategy {
  @override
  void output(List<Object> objects) {
    stdout.write('Sorted Names:\n');
    for (final object in objects) {
      stdout.write('${object.toString()} \n');
    }
  }

  @override
  String description = 'Standard output';
}
