import 'package:collection/collection.dart';
import 'package:name_sort/data/name_repository/file_name_repository.dart';
import 'package:name_sort/data/name_repository/i_name_repository.dart';
import 'package:test/test.dart';

void main() {
  group('file name repository get all strings', () {
    test('new line delimited', () async {
      INameRepository nameRepository = FileNameRepository(
        'test/file_input/test_files/new_line_delimited.txt',
      );

      final namesFromFile = await nameRepository.getAllStrings();

      List<String> expected = [
        'tom',
        'randy',
        'andy',
        'adam',
        'sandy',
      ];

      var resultEqualsExpected = ListEquality().equals(namesFromFile, expected);

      expect(resultEqualsExpected, true);
    });

    test('empty file', () async {
      INameRepository nameRepository = FileNameRepository(
        'test/file_input/test_files/empty_input.txt',
      );

      final namesFromFile = await nameRepository.getAllStrings();

      List<String> expected = [];

      var resultEqualsExpected = ListEquality().equals(namesFromFile, expected);

      expect(resultEqualsExpected, true);
    });

    test('normal file', () async {
      INameRepository nameRepository = FileNameRepository(
        'test/file_input/test_files/suran_input.txt',
      );

      final namesFromFile = await nameRepository.getAllStrings();

      List<String> expected = [
        'Adkins',
        'Asby',
        'Baker',
        'Bostwick',
        'Broome',
        'Byfield',
        'Clevenger',
        'Fitzjerrell',
        'Graff',
        'Lundy',
        'Tanton',
        'Hagberg',
        'Hendrickson',
        'Hickey',
        'Nylon',
        'Reyes',
        'Reynolds',
        'Starkey',
        'Kalivoda',
        'Rogers',
        'Glock',
        'Routson',
        'Kha',
        'Dulaney',
        'Guenther',
        'Hatfield',
        'Stegman',
        'Sullivan',
        'Taylor',
        'Padgett',
        'Heigl',
        'Peery',
        'Wile',
        'Hillman',
        'Foley',
        'McVey',
        'Phillips',
        'Williams',
        'Bain',
        'Cachedon',
        'Kirkland',
        'Evans',
        'Ellis',
        'McCrave',
        'Dean',
        'Michael',
        'Giddings',
        'Laymon',
        'Fife',
        'White',
      ];

      var resultEqualsExpected = ListEquality().equals(namesFromFile, expected);

      expect(resultEqualsExpected, true);
    });
  });
}
