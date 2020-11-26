import 'dart:convert';

import 'package:aircheck/app/strings.dart';
import 'package:aircheck/network/air_quality_stations.dart';
import 'package:aircheck/ui/home/widgets/activities_widget.dart';
import 'package:aircheck/ui/home/widgets/activity_widget.dart';
import 'package:aircheck/ui/home/widgets/animated_percentage_widget.dart';
//import 'package:aircheck/ui/home/widgets/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:aircheck/network/get_api.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AirQualityStations> parseStations(String responsebody) {
    final parsed = jsonDecode(responsebody).cast<Map<String, dynamic>>();
    return parsed.map<AirQualityStations>((json) {
      return AirQualityStations.fromJson(json);
    }).toList();
  }
  // List<Weight> weightData =
  //     mapData.entries.map((entry) => Weight(entry.key, entry.value)).toList();

  Future<List<AirQualityStations>> fetchAirStations() async {
    final response = await http.get(Urls.allStations);
    if (response.statusCode == 200) {
      return parseStations(response.body);
    } else {
      throw Exception("failed to load endpoint");
    }
  }

  Future<List<AirQualityStations>> futureStations;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureStations = fetchAirStations();
  }

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
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 50,
                  child: FutureBuilder<List<AirQualityStations>>(
                      future: futureStations,
                      builder: (context, stationData) {
                        if (stationData.hasData) {
                          return ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return _buildTitle(
                                    context, stationData.data.first.city.name);
                                //Text(stationData.data.first.city.name);
                              });
                        } else if (stationData.hasError) {
                          return Text(stationData.error);
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                ),
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

Widget _buildTitle(BuildContext context, String text) {
  return Text(
    text,
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
