abstract class INameInputStrategy {
  abstract String description;
  Future<List<String>> getAllNames();
}
