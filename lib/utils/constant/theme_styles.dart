import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeStyles {
  static ThemeData switchTheme(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        cardColor: isDarkTheme ? AppColors.darkModeFrame : AppColors.lightColor,
        canvasColor:
            isDarkTheme ? AppColors.darkModeBg : AppColors.lightModeBgHome,
        hintColor: isDarkTheme ? AppColors.lightColor : AppColors.gray4,
        disabledColor: isDarkTheme ? AppColors.darkModeFrame : AppColors.grey);
  }
}
