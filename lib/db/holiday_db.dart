import 'package:happy_holidays/model/national_holiday.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class HolidayDatabase {
  HolidayDatabase(Database db) : _database = db;

  final Database _database;

  Future<void> addHolidays(Iterable<NationalHoliday> holidays) async {
    for (final holiday in holidays) {
      _database.insert('holidays', holiday.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }
}

class HolidayDatabaseFactory {
  Future<Database> _createDatabase() async =>
      await openDatabase(join(await getDatabasesPath(), 'holiday_database.db'), onCreate: (db, version) {
        db.execute('CREATE TABLE holidays (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, date TEXT)');
      });
}