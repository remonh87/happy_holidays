import 'package:flutter_test/flutter_test.dart';
import 'package:happy_holidays/db/holiday_db.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

class MockDb extends Mock implements Database {}

void main() {
  group('$HolidayDatabase', () {
    Database db;
    HolidayDatabase sut;
    setUp(() {
      db = MockDb();
      sut = HolidayDatabase(db);
    });

    group('Insert into db', () {
      test('It inserts holidays', () async {
        when(db.insert(any, any)).thenAnswer((_) => Future.value(0));

        final holiday1 = NationalHoliday(name: 'test', date: DateTime(2020, 1, 1));
        final holiday2 = NationalHoliday.testinstance();
        await sut.addHolidays([holiday1, holiday2]);

        verify(db.insert('holidays', <String, dynamic>{'name': holiday1.name, 'dateEpoch': 1577833200000},
                conflictAlgorithm: ConflictAlgorithm.replace))
            .called(1);

        verify(db.insert('holidays', <String, dynamic>{'name': holiday2.name, 'dateEpoch': 1546297200000},
                nullColumnHack: null, conflictAlgorithm: ConflictAlgorithm.replace))
            .called(1);
      });
    });

    group('Query database', () {
      test('It converts contents to holidays in case db has value', () async {
        when(db.query('holidays')).thenAnswer((_) => Future.value([
              <String, Object>{'name': 'holiday from db', 'dateEpoch': 1577833200000},
              <String, Object>{'name': 'holidaynot to be shown', 'dateEpoch': 1546297200000},
            ]));

        expect(await sut.retrieveHolidays(DateTime(2019, 12, 31)),
            [NationalHoliday(name: 'holiday from db', date: DateTime(2020, 1, 1))]);
      });

      test('It returns empty iterable in case db is empty', () async {
        when(db.query('holidays')).thenAnswer((_) => Future.value([<String, String>{}]));

        expect(await sut.retrieveHolidays(DateTime(2019, 12, 31)), <NationalHoliday>[]);
      });
    });
  });
}
