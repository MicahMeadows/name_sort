import 'package:name_sort/data/name_repository/i_name_repository.dart';
import 'package:name_sort/input/i_name_input_strategy.dart';

/// Name input strategy capable of handling Name Repositories
/// [nameRepository] the repository that will be accessed during input
class RepositoryNameInputStrategy implements INameInputStrategy {
  final INameRepository nameRepository;
  RepositoryNameInputStrategy({required this.nameRepository});

  @override
  Future<List<String>> getAllNames() {
    return nameRepository.getAllStrings();
  }

  @override
  String description = 'Data from file';
}
