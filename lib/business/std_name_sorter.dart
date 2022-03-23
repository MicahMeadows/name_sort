import 'dart:io';

import 'package:name_sort/business/i_app.dart';
import 'package:name_sort/business/sorting/i_sort_strategy.dart';
import 'package:name_sort/input/i_name_input_strategy.dart';
import 'package:name_sort/output/i_list_output_strategy.dart';

class StdNameSorter implements IApp {
  /// Types of input allowed
  final List<INameInputStrategy> inputStrategies;

  /// Types of output allowed
  final List<IListOutputStrategy> outputStrategies;

  /// Types of sorting allowed
  final List<INameSortStrategy> sortStrategies;

  /// A sorting app using std console
  const StdNameSorter({
    required this.inputStrategies,
    required this.outputStrategies,
    required this.sortStrategies,
  });

  @override
  void run() async {
    final _inputStrategy = _promptUserForInputStrategy();

    var _namesToSort = await _inputStrategy.getAllNames();

    _namesToSort = filterInvalidInput(_namesToSort);

    final _sortStrategy = _promptUserForSortStrategy();

    final _sortedNames = _sortStrategy.sort(_namesToSort);

    final _outputStrategy = _promptUserForOutputStrategy();

    _outputStrategy.output(_sortedNames);
  }

  List<String> filterInvalidInput(List<String> origional) {
    var filters = [...origional];
    filters.removeWhere((name) => name.isEmpty);
    return filters;
  }

  INameInputStrategy _promptUserForInputStrategy() {
    _displayInputStrategyOptionsMenu();

    var _userChoice = _getUserNumberInput();

    final chosenStrategy = getInputStrategyFromChoice(_userChoice);

    return chosenStrategy ?? _promptUserForInputStrategy();
  }

  INameInputStrategy? getInputStrategyFromChoice(int userChoice) {
    try {
      return inputStrategies[userChoice - 1];
    } catch (e) {
      stdout.write('Invalid response...\n');
      return null;
    }
  }

  void _displayInputStrategyOptionsMenu() {
    _buildOptionsMenu(
      promptMessage: '~ How would you like to receive input?',
      numItems: inputStrategies.length,
      optionBuilder: (idx) => inputStrategies[idx].description,
    );
  }

  IListOutputStrategy _promptUserForOutputStrategy() {
    _displayOutputStrategyOptionsMenu();

    var _userChoice = _getUserNumberInput();

    final _chosenStrategy = _getOutputStrategyFromChoice(_userChoice);

    return _chosenStrategy ?? _promptUserForOutputStrategy();
  }

  IListOutputStrategy? _getOutputStrategyFromChoice(int userChoice) {
    try {
      return outputStrategies[userChoice - 1];
    } catch (e) {
      stdout.write('Invalid response...\n');
      return null;
    }
  }

  void _displayOutputStrategyOptionsMenu() {
    _buildOptionsMenu(
      promptMessage: '~ Where would you like to view the sorting results?',
      numItems: outputStrategies.length,
      optionBuilder: (idx) => outputStrategies[idx].description,
    );
  }

  INameSortStrategy _promptUserForSortStrategy() {
    _displaySortStrategyOptionsMenu();

    var _userChoice = _getUserNumberInput();

    final _chosenStrategy = _getSortStrategyFromChoice(_userChoice);

    return _chosenStrategy ?? _promptUserForSortStrategy();
  }

  INameSortStrategy? _getSortStrategyFromChoice(int userChoice) {
    try {
      return sortStrategies[userChoice - 1];
    } catch (e) {
      stdout.write('Invalid response...\n');
      return null;
    }
  }

  void _displaySortStrategyOptionsMenu() {
    _buildOptionsMenu(
      promptMessage: '~ How would you like to sort?',
      numItems: sortStrategies.length,
      optionBuilder: (idx) => sortStrategies[idx].description,
    );
  }

  void _buildOptionsMenu({
    required String promptMessage,
    required int numItems,
    required String Function(int idx) optionBuilder,
  }) {
    stdout.write('\n$promptMessage (Choose #)\n');
    for (int i = 0; i < numItems; i++) {
      stdout.write('${i + 1}. ${optionBuilder(i)}\n');
    }
    stdout.write('<- ');
  }

  int _getUserNumberInput() {
    var userResponse = stdin.readLineSync()?.toLowerCase();
    try {
      var userResponseValue = int.parse(userResponse!);
      return userResponseValue;
    } catch (e) {
      // return null;
      print('Invalid response... try again.');
      return _getUserNumberInput();
    }
  }
}
