import 'package:name_sort/business/i_app.dart';
import 'package:name_sort/business/sorting/normal_sort_strategy.dart';
import 'package:name_sort/business/sorting/reverse_sort_strategy.dart';
import 'package:name_sort/business/std_name_sorter.dart';
import 'package:name_sort/data/name_repository/i_name_repository.dart';
import 'package:name_sort/data/name_repository/file_name_repository.dart';
import 'package:name_sort/input/repository_name_input_strategy.dart';
import 'package:name_sort/input/std_name_input_strategy.dart';
import 'package:name_sort/output/file_output_strategy.dart';
import 'package:name_sort/output/std_output_strategy.dart';

// Repository For Accessing Names From Text File
INameRepository _nameRepository = FileNameRepository.asset('Sort Me.txt');

// Initialize Command Line Menu Based Sorting App
IApp _nameSortingApp = StdNameSorter(
  sortStrategies: [
    NormalSortStrategy(),
    ReverseSortStrategy(),
  ],
  inputStrategies: [
    StdNameInputStrategy(),
    RepositoryNameInputStrategy(nameRepository: _nameRepository),
  ],
  outputStrategies: [
    StdOutputStrategy(),
    FileOutputStrategy(
      filePath: 'bin/results/',
      fileNamePrefix: 'Sorted Names',
    ),
  ],
);

void main(List<String> arguments) => _nameSortingApp.run();
