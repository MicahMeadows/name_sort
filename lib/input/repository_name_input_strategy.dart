import 'package:name_sort/data/name_repository/i_name_repository.dart';
import 'package:name_sort/input/i_name_input_strategy.dart';

/// Name input strategy capable of handling Name Repositories
/// [nameRepository] the repository that will be accessed during input
class RepositoryNameInputStrategy implements INameInputStrategy {
  final INameRepository nameRepository;
  RepositoryNameInputStrategy({
    required this.nameRepository,
    required this.description,
  });

  @override
  Future<List<String>> getAllNames() {
    return nameRepository.getAllStrings();
  }

  @override
  final String description;
}
