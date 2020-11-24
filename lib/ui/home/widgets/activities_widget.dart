import 'package:aircheck/ui/home/widgets/activity_widget.dart';
import 'package:flutter/material.dart';

abstract class _Constants {
  static const double iconSize = 30.0;
  static const double itemSpacing = 20.0;
  static const double badgeSize = 15.0;
}

class ActivitiesWidget extends StatelessWidget {
  const ActivitiesWidget({
    Key key,
    this.activities,
  }) : super(key: key);

  final Map<ActivityType, ActivityQuality> activities;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _buildActivities(),
    );
  }

  // the other widgets involved.
  Widget _buildSpacing() {
    return SizedBox(
      width: _Constants.itemSpacing - _Constants.badgeSize / 2,
    );
  }

  List<Widget> _buildActivities() {
    List<Widget> widgets = [
      SizedBox(
        width: _Constants.itemSpacing,
      )
    ];

    activities.forEach((activityType, activityQuality) {
      widgets
        ..add(
          ActivityWidget(
            activityType: activityType,
            activityQuality: activityQuality,
          ),
        )
        ..add(_buildSpacing());
    });
    return widgets;
  }
}
