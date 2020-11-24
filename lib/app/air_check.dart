import 'package:aircheck/app/app_theme.dart';
import 'package:aircheck/ui/home/home_page.dart';
import 'package:flutter/material.dart';

class AirCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemeDataFactory.prepareThemeData(),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
