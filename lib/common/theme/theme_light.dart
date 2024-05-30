import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

ThemeData themeLight = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.white,
  brightness: Brightness.light,
  disabledColor: AppColors.greyLight,
  appBarTheme: _appBarTheme,
  primaryColor: AppColors.black,
  primaryColorDark: AppColors.white,
  inputDecorationTheme: _inputDecorationTheme,
  bottomNavigationBarTheme: _bottomNavigationBarThemeData,
  textTheme: _lightTextTheme,
  iconTheme: const IconThemeData(color: AppColors.greyDark),
  colorScheme: _colorScheme,
);

TextTheme _lightTextTheme = TextTheme(
  bodyMedium: Poppins().size14Weihtg400,
  bodySmall: Poppins().size12Weihtg400,
  titleMedium: Poppins().size24Weihtg500,
  titleSmall: Poppins().size15Weihtg500,
  labelSmall: Poppins().size12Weihtg500,
);

ColorScheme _colorScheme = ColorScheme.fromSwatch().copyWith(
  brightness: Brightness.light,
  onPrimary: AppColors.white,
  primary: AppColors.black,
  error: AppColors.pinkDark,
  onError: AppColors.white,
);

BottomNavigationBarThemeData _bottomNavigationBarThemeData =
    const BottomNavigationBarThemeData(
  elevation: 0,
  type: BottomNavigationBarType.fixed,
  backgroundColor: AppColors.white,
  selectedItemColor: AppColors.greyDark,
  selectedIconTheme: IconThemeData(color: AppColors.white),
  unselectedItemColor: AppColors.white,
  unselectedIconTheme: IconThemeData(color: AppColors.greyDark),
);

InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  suffixIconColor: AppColors.greyDark,
  iconColor: AppColors.greyDark,
  hintStyle: Poppins().size12Weihtg400.copyWith(color: AppColors.greyLight),
  disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyLight),
      borderRadius: BorderRadius.all(Radius.circular(13))),
  enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyDark),
      borderRadius: BorderRadius.all(Radius.circular(13))),
  focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyDark),
      borderRadius: BorderRadius.all(Radius.circular(13))),
  errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.pinkLight),
      borderRadius: BorderRadius.all(Radius.circular(13))),
  focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.pinkDark),
      borderRadius: BorderRadius.all(Radius.circular(13))),
);

AppBarTheme _appBarTheme = const AppBarTheme(
  centerTitle: false,
  foregroundColor: AppColors.greyDark,
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(color: AppColors.greyDark),
  elevation: 0,
);
