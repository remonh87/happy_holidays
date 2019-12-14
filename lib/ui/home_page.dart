import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:functional_data/functional_data.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:provider/provider.dart';

part 'home_page.g.dart';
//ignore_for_file: annotate_overrides

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Selector<Iterable<NationalHoliday>, HomePageViewModel>(
              selector: (_, holidays) => HomePageViewModel.fromState(holidays),
              builder: (context, viewModel, __) =>
                  Text(viewModel.holidays.isNotEmpty ? viewModel.holidays.first.name : 'Retrieving holidays'),
            ),
          ],
        ),
      ),
    );
  }
}

@visibleForTesting
@FunctionalData()
class HomePageViewModel extends $HomePageViewModel {
  const HomePageViewModel({@required this.holidays});

  HomePageViewModel.fromState(Iterable<NationalHoliday> holidays) : this(holidays: holidays);

  @CustomEquality(DeepCollectionEquality.unordered())
  final Iterable<NationalHoliday> holidays;
}
