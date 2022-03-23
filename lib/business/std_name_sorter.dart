import 'dart:io';

import 'package:name_sort/business/i_app.dart';
import 'package:name_sort/business/sorting/i_sort_strategy.dart';
import 'package:name_sort/business/sorting/string_sorting.dart';
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

    // // Get user input and determine strategy to use
    var _userChoice = _getUserNumberInput();
    try {
      return inputStrategies[_userChoice! - 1];
    } catch (e) {
      stdout.write('Invalid response...\n');
      return _promptUserForInputStrategy();
    }
  }

  void _displayInputStrategyOptionsMenu() {
    stdout.write('\n~ How would you like to input the names? (Choose #)\n');
    inputStrategies.asMap().forEach((idx, element) {
      stdout.write('${idx + 1}. ${inputStrategies[idx].description}\n');
    });
    stdout.write('<- ');
  }

  IListOutputStrategy _promptUserForOutputStrategy() {
    _displayOutputStrategyOptionsMenu();

    var _userChoice = _getUserNumberInput();
    try {
      return outputStrategies[_userChoice! - 1];
    } catch (e) {
      stdout.write('Invalid response...\n');
      return _promptUserForOutputStrategy();
    }
  }

  void _displayOutputStrategyOptionsMenu() {
    stdout.write(
        '\n~ Where would you like to view the sorting results? (Choose #)\n');
    outputStrategies.asMap().forEach((idx, element) {
      stdout.write('${idx + 1}. ${outputStrategies[idx].description}\n');
    });
    stdout.write('<- ');
  }

  int? _getUserNumberInput() {
    var userResponse = stdin.readLineSync()?.toLowerCase();
    try {
      var userResponseValue = int.parse(userResponse!);
      return userResponseValue;
    } catch (e) {
      return null;
    }
  }

  INameSortStrategy _promptUserForSortStrategy() {
    _displaySortStrategyOptionsMenu();
    var _userChoice = _getUserNumberInput();
    try {
      return sortStrategies[_userChoice! - 1];
    } catch (e) {
      stdout.write('Invalid response...\n');
      return _promptUserForSortStrategy();
    }
  }

  void _displaySortStrategyOptionsMenu() {
    stdout.write('\n~ How would you like to sort? (Choose #)\n');
    sortStrategies.asMap().forEach((idx, element) {
      stdout.write('${idx + 1}. ${sortStrategies[idx].description}\n');
    });
    stdout.write('<- ');
  }
}
