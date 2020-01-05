import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:functional_data/functional_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happy_holidays/model/national_holiday.dart';
import 'package:provider/provider.dart';

import 'flag_rounded_image.dart';

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
class HomepageScreen extends StatefulWidget {
  const HomepageScreen({@required this.viewModel, Key key}) : super(key: key);

  final HomePageViewModel viewModel;

  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedHolidayPage(
      holiday: widget.viewModel.holiday,
      controller: _controller,
    );
  }
}

class AnimatedHolidayPage extends StatelessWidget {
  AnimatedHolidayPage({
    @required this.holiday,
    @required AnimationController controller,
    Key key,
  })  : assert(controller != null),
        animation = _StaggeredHolidayAnimation(controller: controller),
        super(key: key);

  final NationalHoliday holiday;
  final _StaggeredHolidayAnimation animation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Opacity(
                opacity: animation.opacityDateAnimation.value,
                child: Text(
                  '${holiday.date}',
                  style: GoogleFonts.kavoon(fontSize: 34.0),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: FlagRoundedImage(
                  offsetAnimation: animation.offsetFlagAnimation,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ScaleTransition(
                scale: animation.scaleHolidayAnimation,
                child: Text(
                  holiday?.name ?? 'Retrieving holidays',
                  style: GoogleFonts.kavoon(fontSize: 24.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
      builder: _buildAnimation,
    );
  }
}

@visibleForTesting
@FunctionalData()
class HomePageViewModel extends $HomePageViewModel {
  const HomePageViewModel({@required this.holiday});

  HomePageViewModel.fromState(Iterable<NationalHoliday> holidays)
      : this(holiday: holidays.first);

  @CustomEquality(DeepCollectionEquality.unordered())
  final NationalHoliday holiday;
}

// #6d80d5   #1d49c2  #1641b8 #002da1
// #b88d16

class _StaggeredHolidayAnimation {
  _StaggeredHolidayAnimation({@required this.controller})
      : assert(controller != null),
        opacityDateAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.33, curve: Curves.ease),
          ),
        ),
        scaleHolidayAnimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.34, 0.66, curve: Curves.ease),
          ),
        ),
        offsetFlagAnimation =
            Tween(begin: const Offset(-4.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.67, 1.0, curve: Curves.ease),
          ),
        );

  final AnimationController controller;
  final Animation<double> opacityDateAnimation;
  final Animation<double> scaleHolidayAnimation;
  final Animation<Offset> offsetFlagAnimation;
}
