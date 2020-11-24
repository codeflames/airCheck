import 'package:aircheck/app/strings.dart';
import 'package:aircheck/ui/home/widgets/activities_widget.dart';
import 'package:aircheck/ui/home/widgets/activity_widget.dart';
import 'package:aircheck/ui/home/widgets/animated_percentage_widget.dart';
import 'package:aircheck/ui/home/widgets/video_player_widget.dart';
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
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/fog.png",
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTitle(context),
                // Container(
                //   height: 150,
                //   child: VideoPlayerWidget(videoPath: "assets/videos/fog.mp4"),
                // ),
                _buildExpandedContent(context),
                _buildActivitiesWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildAirPollutionContent(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      AnimatedPercentageWidget(fromValue: 0, toValue: 310),
      Text(
        Strings.airQualityNorm,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    ],
  );
}

Widget _buildTitle(BuildContext context) {
  return Text(
    Strings.exampleCityName,
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.subtitle1,
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

Widget _buildDetailsWidget(BuildContext context) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Opacity(
            opacity: 0.5,
            child: Text(
              Strings.details,
              style: Theme.of(context).textTheme.bodyText1,
            )),
        SizedBox(height: 5),
        Image.asset("assets/images/icon_arrow_down.png", width: 7, height: 7),
      ],
    ),
  );
}

Widget _buildExpandedContent(BuildContext context) {
  return Expanded(
    child: Column(
      children: <Widget>[
        Expanded(child: Container()),
        _buildAirPollutionContent(context),
        _buildDetailsWidget(context),
      ],
    ),
  );
}
