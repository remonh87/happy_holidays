import 'package:flutter/foundation.dart';
import 'package:functional_data/functional_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'national_holiday.g.dart';

//ignore_for_file: annotate_overrides
@JsonSerializable()
@FunctionalData()
class NationalHoliday extends $NationalHoliday {
  const NationalHoliday({@required this.name, @required this.date});

  factory NationalHoliday.fromJson(Map<String, dynamic> json) =>
      _$NationalHolidayFromJson(json);

  final String name;
  final String date;

  Map<String, dynamic> toJson() => _$NationalHolidayToJson(this);
}
