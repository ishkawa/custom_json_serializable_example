import 'package:example/example.dart';
import 'package:test/test.dart';

void main() {
  group('fromJson', () {
    test('instatiates DateTime using JSON unixmillisecond value', () {
      final item = Item.fromJson({'createdAt': 1583654233836});
      expect(item.createdAt.year, equals(2020));
      expect(item.createdAt.month, equals(3));
      expect(item.createdAt.day, equals(8));
    });
  });
}
