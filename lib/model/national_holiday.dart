import 'package:flutter/foundation.dart';
import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'national_holiday.g.dart';

//ignore_for_file: annotate_overrides
@JsonSerializable()
@FunctionalData()
class NationalHoliday extends $NationalHoliday {
  const NationalHoliday({@required this.name, @required this.date})
      : assert(name != null),
        assert(date != null);

  factory NationalHoliday.fromJson(Map<String, dynamic> json) =>
      _$NationalHolidayFromJson(json);

  @visibleForTesting
  factory NationalHoliday.testinstance() =>
      NationalHoliday(name: 'test', date: DateTime(2019, 1, 1));

  final String name;
  final DateTime date;

  Map<String, dynamic> toJson() => _$NationalHolidayToJson(this);
}
