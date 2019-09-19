import 'package:flutter_test/flutter_test.dart';
import 'package:happy_holidays/db/holiday_db.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

class MockDb extends Mock implements Database {}

void main() {
  group('$HolidayDatabase', () {
    Database db;
    HolidayDatabase holidayDatabase;
    setUp(() {
      db = MockDb();
      holidayDatabase = HolidayDatabase(db);
      when(db.insert(any, any)).thenAnswer((_) => Future.value(0));
    });

    test('It inserts holidays', () async {
      const holiday1 = NationalHoliday(name: 'test', date: '2020-01-01');
      final holiday2 = NationalHoliday.testinstance();
      await holidayDatabase.addHolidays([holiday1, holiday2]);

      verify(db.insert('holidays', <String, dynamic>{'name': holiday1.name, 'date': holiday1.date},
              conflictAlgorithm: ConflictAlgorithm.replace))
          .called(1);

      verify(db.insert('holidays', <String, dynamic>{'name': holiday2.name, 'date': holiday2.date},
              conflictAlgorithm: ConflictAlgorithm.replace))
          .called(1);
    });
  });
}
