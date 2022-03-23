import 'package:name_sort/business/sorting/i_sort_strategy.dart';
import 'package:name_sort/business/sorting/string_sorting.dart';

class NormalSortStrategy implements INameSortStrategy {
  @override
  List<String> sort(List<String> namesToSort) {
    return sortStrings(namesToSort);
  }

  @override
  String description = 'Normal (Sort by length, then alphabetical)';
}
