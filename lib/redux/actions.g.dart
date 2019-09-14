// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $AddHolidaysAction {
  Iterable<NationalHoliday> get holidays;
  const $AddHolidaysAction();
  AddHolidaysAction copyWith({Iterable<NationalHoliday> holidays}) =>
      AddHolidaysAction(holidays: holidays ?? this.holidays);
  String toString() => "AddHolidaysAction(holidays: $holidays)";
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      const DeepCollectionEquality().equals(holidays, other.holidays);
  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + const DeepCollectionEquality().hash(holidays);
    return result;
  }
}

class AddHolidaysAction$ {
  static final holidays = Lens<AddHolidaysAction, Iterable<NationalHoliday>>(
      (s_) => s_.holidays, (s_, holidays) => s_.copyWith(holidays: holidays));
}
