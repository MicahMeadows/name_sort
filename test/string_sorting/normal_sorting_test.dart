import 'package:collection/collection.dart';
import 'package:name_sort/business/sorting/string_sorting.dart';
import 'package:test/test.dart';

void main() {
  group('normal sorting', () {
    test('single element', () {
      final input = ['tom'];
      final result = sortStrings(input);
      final expected = ['tom'];
      bool resultEqualsExpected = ListEquality().equals(result, expected);

      expect(resultEqualsExpected, true);
    });

    test('empty input', () {
      final input = <String>[];
      final result = sortStrings(input);
      final expectedOutput = <String>[];

      bool resultEqualsOutput = ListEquality().equals(result, expectedOutput);

      expect(resultEqualsOutput, true);
    });
    test('pre reverse sorted', () {
      final input = [
        'dddz',
        'dddd',
        'ccc',
        'bb',
        'a',
      ];
      final result = sortStrings(input);
      final expected = [
        'a',
        'bb',
        'ccc',
        'dddd',
        'dddz',
      ];

      bool resultIsExpected = ListEquality().equals(result, expected);

      expect(resultIsExpected, true);
    });

    test('pre normal sorted', () {
      final input = [
        'a',
        'bb',
        'ccc',
        'dddd',
        'dddz',
      ];
      final result = sortStrings(input);
      final expected = [
        'a',
        'bb',
        'ccc',
        'dddd',
        'dddz',
      ];

      bool resultIsExpected = ListEquality().equals(result, expected);

      expect(resultIsExpected, true);
    });

    test('regular', () {
      final input = [
        'jonah',
        'adam',
        'micah',
        'tom',
        'anthony',
        'aron',
        'aaron',
        'jack',
      ];

      final result = sortStrings(input);

      final expectedOutput = [
        'tom',
        'adam',
        'aron',
        'jack',
        'aaron',
        'jonah',
        'micah',
        'anthony',
      ];

      bool listsAreEqual = ListEquality().equals(result, expectedOutput);

      expect(listsAreEqual, true);
    });
  });
}
