import 'package:aircheck/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeDataFactory {
  static ThemeData prepareThemeData() {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        accentColor: AppColors.textPrimary,
        backgroundColor: AppColors.background,
        fontFamily: "Roboto",
        textTheme: TextTheme(
            headline6: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary),
            subtitle2: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary),
            subtitle1: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary),
            bodyText1: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary)));
  }
}
