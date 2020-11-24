import 'package:aircheck/ui/home/widgets/activities_widget.dart';
import 'package:aircheck/ui/home/widgets/activity_widget.dart';
import 'package:aircheck/ui/home/widgets/animated_percentage_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildTitle(),
            _buildExpandedContent(),
            _buildActivitiesWidget(),
          ],
        ),
      ),
    );
  }
}

Widget _buildAirPollutionContent() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      AnimatedPercentageWidget(fromValue: 0, toValue: 310),
      Text("norm"),
    ],
  );
}

Widget _buildTitle() {
  return Text(
    "Port Harcourt",
    textAlign: TextAlign.center,
  );
}

Widget _buildActivitiesWidget() {
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: ActivitiesWidget(
      activities: {
        ActivityType.walking: ActivityQuality.good,
        ActivityType.running: ActivityQuality.bad,
        ActivityType.biking: ActivityQuality.bad,
      },
    ),
  );
}

Widget _buildDetailsWidget() {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Opacity(opacity: 0.5, child: Text("Details")),
        SizedBox(height: 5),
        Image.asset("assets/images/icon_arrow_down.png", width: 7, height: 7),
      ],
    ),
  );
}

Widget _buildExpandedContent() {
  return Expanded(
    child: Column(
      children: <Widget>[
        Expanded(child: Container()),
        _buildAirPollutionContent(),
        _buildDetailsWidget(),
      ],
    ),
  );
}
