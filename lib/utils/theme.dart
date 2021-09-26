import 'package:flutter/material.dart';
import 'package:flutter_todo_app/utils/color.dart';

class Themes {
  static final light = ThemeData(
        primaryColor: primaryClr, // change appbar and button
        brightness: Brightness.light, // change background, text change to black
  );

  static final dark = ThemeData(
        primaryColor: darkGreyClr, // change appbar and button
        brightness: Brightness.dark, // change background, text change to black
  );
}