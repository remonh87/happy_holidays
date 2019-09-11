// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'national_holiday.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $NationalHoliday {
  String get name;
  String get date;
  const $NationalHoliday();
  NationalHoliday copyWith({String name, String date}) =>
      NationalHoliday(name: name ?? this.name, date: date ?? this.date);
  String toString() => "NationalHoliday(name: $name, date: $date)";
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      name == other.name &&
      date == other.date;
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + name.hashCode;
    result = 37 * result + date.hashCode;
    return result;
  }
}

class NationalHoliday$ {
  static final name = Lens<NationalHoliday, String>(
      (s_) => s_.name, (s_, name) => s_.copyWith(name: name));
  static final date = Lens<NationalHoliday, String>(
      (s_) => s_.date, (s_, date) => s_.copyWith(date: date));
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NationalHoliday _$NationalHolidayFromJson(Map<String, dynamic> json) {
  return NationalHoliday(
    name: json['name'] as String,
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$NationalHolidayToJson(NationalHoliday instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
    };
