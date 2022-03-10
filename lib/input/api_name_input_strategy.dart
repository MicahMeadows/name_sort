import 'package:name_sort/input/i_name_input_strategy.dart';

class ApiNameInputStrategy implements INameInputStrategy {
  @override
  String description = 'Api name list';

  @override
  Future<List<String>> getAllNames() {
    return Future.value([
      'kiby',
      'tom',
      'bob',
      'dillon',
    ]);
  }
}
