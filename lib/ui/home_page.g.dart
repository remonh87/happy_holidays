// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $HomePageViewModel {
  Iterable<NationalHoliday> get holidays;
  const $HomePageViewModel();
  HomePageViewModel copyWith({Iterable<NationalHoliday> holidays}) =>
      HomePageViewModel(holidays: holidays ?? this.holidays);
  String toString() => "HomePageViewModel(holidays: $holidays)";
  bool operator ==(dynamic other) =>
      other.runtimeType == runtimeType &&
      const DeepCollectionEquality.unordered().equals(holidays, other.holidays);
  @override
  int get hashCode {
    var result = 17;
    result =
        37 * result + const DeepCollectionEquality.unordered().hash(holidays);
    return result;
  }
}

class HomePageViewModel$ {
  static final holidays = Lens<HomePageViewModel, Iterable<NationalHoliday>>(
      (s_) => s_.holidays, (s_, holidays) => s_.copyWith(holidays: holidays));
}
