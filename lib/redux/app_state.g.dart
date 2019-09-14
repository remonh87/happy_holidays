// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $AppState {
  Iterable<NationalHoliday> get nationalHolidays;
  const $AppState();
  AppState copyWith({Iterable<NationalHoliday> nationalHolidays}) =>
      AppState(nationalHolidays: nationalHolidays ?? this.nationalHolidays);
  String toString() => "AppState(nationalHolidays: $nationalHolidays)";
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      const DeepCollectionEquality()
          .equals(nationalHolidays, other.nationalHolidays);
  @override
  int get hashCode {
    var result = 17;
    result =
        37 * result + const DeepCollectionEquality().hash(nationalHolidays);
    return result;
  }
}

class AppState$ {
  static final nationalHolidays = Lens<AppState, Iterable<NationalHoliday>>(
      (s_) => s_.nationalHolidays,
      (s_, nationalHolidays) =>
          s_.copyWith(nationalHolidays: nationalHolidays));
}
