import 'dart:convert';
import 'dart:io';

import 'package:name_sort/output/i_list_output_strategy.dart';

/// Output strategy capable of outputting list of objects to a file
class FileOutputStrategy implements IListOutputStrategy {
  final String filePath;
  final String fileNamePrefix;

  FileOutputStrategy({
    required this.filePath,
    required this.fileNamePrefix,
  });

  @override
  String description = 'Generated file';

  @override
  void output(List<Object> objects) async {
    var trackerId = await _createOrUpdateTracker();

    final fileName = '${fileNamePrefix}_$trackerId';

    var outputString = _generateResultOutputString(objects);

    var newOutputFile = await _createNewResultFile(fileName, outputString);

    _notifyUserOfCreation(newOutputFile.path);
  }

  /// Updates tracker file to keep name ids up to date
  /// If one does not exist it will create one and set
  /// the default id value to 0.
  Future<int> _createOrUpdateTracker() async {
    var trackerId = 0;
    try {
      var trackerFile = await (await File('./bin/results/tracker.json')
              .create(recursive: true))
          .readAsString();

      var trackerData = jsonDecode(trackerFile);
      trackerId = trackerData["lastId"] + 1;
      trackerData["lastId"] = trackerId;

      var newTrackerFile = jsonEncode(trackerData);

      await (await File('${filePath}tracker.json').create(recursive: true))
          .writeAsString(newTrackerFile);
    } catch (e) {
      await (await File('${filePath}tracker.json').create(recursive: true))
          .writeAsString(jsonEncode({"lastId": 0}));
    }
    return trackerId;
  }

  Future<File> _createNewResultFile(String fileName, String output) async {
    return await File('$filePath$fileName.txt').writeAsString(output);
  }

  void _notifyUserOfCreation(String path) {
    stdout.write("""~ Sorted and stored text in file created at '$path'
~ run '\$ cat '$path' to view it.\n""");
  }

  String _generateResultOutputString(List<Object> objects) {
    String outputString = '';
    for (var object in objects) {
      outputString += object.toString() + '\n';
    }
    return outputString;
  }
}
