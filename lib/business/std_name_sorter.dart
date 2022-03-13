import 'dart:io';

import 'package:name_sort/business/i_app.dart';
import 'package:name_sort/business/string_sorting.dart';
import 'package:name_sort/input/i_name_input_strategy.dart';
import 'package:name_sort/output/i_list_output_strategy.dart';

class StdNameSorter implements IApp {
  /// Types of input allowed
  final List<INameInputStrategy> inputStrategies;

  /// Types of output allowed
  final List<IListOutputStrategy> outputStrategies;

  /// A sorting app using std console
  const StdNameSorter({
    required this.inputStrategies,
    required this.outputStrategies,
  });

  @override
  void run() async {
    var _inputStrategy = _promptUserForInputStrategy();

    var _namesToSort = await _inputStrategy.getAllNames();

    _namesToSort.removeWhere((name) => name.isEmpty);

    var _sortedNames = sortStrings(
      _namesToSort,
      ascendingSize: true,
      subOrderAlphabetical: true,
    );

    var _outputStrategy = _promptUserForOutputStrategy();

    _outputStrategy.output(_sortedNames);
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
}
