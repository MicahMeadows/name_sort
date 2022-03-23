import 'package:name_sort/business/sorting/i_sort_strategy.dart';
import 'package:name_sort/business/sorting/string_sorting.dart';
import 'package:name_sort/business/std_name_sorter.dart';

class ReverseSortStrategy implements INameSortStrategy {
  @override
  String description =
      'Reversed (Sort by largest length, then reverse alphabetical)';

  @override
  List<String> sort(List<String> namesToSort) {
    return sortStrings(
      namesToSort,
      ascendingSize: false,
      subOrderAlphabetical: false,
    );
  }
}
