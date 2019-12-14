import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:functional_data/functional_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:provider/provider.dart';

part 'home_page.g.dart';
//ignore_for_file: annotate_overrides

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: Selector<Iterable<NationalHoliday>, HomePageViewModel>(
          selector: (_, holidays) => HomePageViewModel.fromState(holidays),
          builder: (context, viewModel, __) =>
              HomepageScreen(viewModel: viewModel)),
    );
  }
}

@visibleForTesting
class HomepageScreen extends StatelessWidget {
  const HomepageScreen({@required this.viewModel, Key key}) : super(key: key);

  final HomePageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                '${viewModel.holidays.first.date}',
                style: GoogleFonts.kavoon(fontSize: 34.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://github.com/remonh87/country-flags/blob/master/png250px/za.png?raw=true',
                    ),
                    fit: BoxFit.fill,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[900],
                        blurRadius: 5.0,
                        spreadRadius: 2.0)
                  ],
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                viewModel.holidays.isNotEmpty
                    ? viewModel.holidays.first.name
                    : 'Retrieving holidays',
                style: GoogleFonts.kavoon(fontSize: 24.0),
              ),
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

  HomePageViewModel.fromState(Iterable<NationalHoliday> holidays)
      : this(holidays: holidays);

  @CustomEquality(DeepCollectionEquality.unordered())
  final Iterable<NationalHoliday> holidays;
}

// #6d80d5   #1d49c2  #1641b8 #002da1
// #b88d16
