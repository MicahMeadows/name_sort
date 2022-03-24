abstract class INameInputStrategy {
  abstract final String description;
  Future<List<String>> getAllNames();
}
