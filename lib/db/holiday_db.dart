import 'package:happy_holidays/model/national_holiday.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class HolidayDatabase {
  HolidayDatabase(Database db) : _database = db;

  final Database _database;

  Future<void> addHolidays(Iterable<NationalHoliday> holidays) async {
    for (final holiday in holidays) {
      final holidayMap = {
        'name': holiday.name,
        'dateEpoch': holiday.date.millisecondsSinceEpoch
      };
      _database.insert('holidays', holidayMap,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<Iterable<NationalHoliday>> retrieveHolidays(
      DateTime lowerBound) async {
    final result = await _database.query('holidays');
    if (result.isNotEmpty && result.first.isNotEmpty) {
      return result
          .map(
            (r) => NationalHoliday(
              name: r['name'],
              date: DateTime.fromMillisecondsSinceEpoch(r['dateEpoch']),
            ),
          )
          .where((holiday) => holiday.date.isAfter(lowerBound));
    } else {
      return <NationalHoliday>[];
    }
  }
}

class HolidayDatabaseFactory {
  Future<Database> createDatabase() async =>
      await openDatabase(join(await getDatabasesPath(), 'holiday_database.db'),
          onCreate: (db, version) {
        db.execute(
            'CREATE TABLE holidays (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, dateEpoch INTEGER)');
      }, version: 1);
}
