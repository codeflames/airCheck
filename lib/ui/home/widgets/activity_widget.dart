import 'package:aircheck/app/app_icons.dart';
import 'package:aircheck/app/strings.dart';
import 'package:flutter/material.dart';

enum ActivityType { walking, running, biking }
enum ActivityQuality { good, bad }

abstract class _Constants {
  static const double iconSize = 30;
  static const double itemSpacing = 20;
  static const double badgeSize = 15;
}

class ActivityWidget extends StatelessWidget {
  final ActivityType activityType;
  final ActivityQuality activityQuality;

  const ActivityWidget({Key key, this.activityType, this.activityQuality})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: _Constants.badgeSize / 2, right: _Constants.badgeSize / 2),
            child: _buildActivityContainer(
                context,
                _imageForActivityType(activityType),
                _titleForActivityType(activityType)),
          ),
          Positioned(
            child: _buildWarningBadge(activityQuality),
            right: 0,
            top: 0,
          )
        ],
      ),
    );
  }

  Widget _buildWarningBadge(ActivityQuality quality) {
    switch (quality) {
      case ActivityQuality.good:
        return Container(
          width: _Constants.badgeSize,
          height: _Constants.badgeSize,
          child: Image.asset(AppIcons.good),
        );
      case ActivityQuality.bad:
        return Container(
          width: _Constants.badgeSize,
          height: _Constants.badgeSize,
          child: Image.asset(AppIcons.warning),
        );
    }
    return Container();
  }

  Widget _buildActivityContainer(
    BuildContext context,
    Image activityIcon,
    String title,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(60),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Center(
          child: _buildActivityColumn(context, activityIcon, title),
        ),
      ),
    );
  }

  Widget _buildActivityColumn(
    BuildContext context,
    Image activityIcon,
    String title,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: _Constants.iconSize,
          height: _Constants.iconSize,
          child: activityIcon,
        ),
        SizedBox(height: 10),
        Opacity(
          opacity: 0.75,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }

  Image _imageForActivityType(ActivityType activityType) {
    switch (activityType) {
      case ActivityType.walking:
        return Image.asset(AppIcons.walking);
      case ActivityType.running:
        return Image.asset(AppIcons.run);
      case ActivityType.biking:
        return Image.asset(AppIcons.cycle);
    }

    return null;
  }

  String _titleForActivityType(ActivityType activityType) {
    switch (activityType) {
      case ActivityType.walking:
        return Strings.activityWalking;
      case ActivityType.running:
        return Strings.activityRunning;
      case ActivityType.biking:
        return Strings.activityBiking;
    }

    return null;
  }
}
