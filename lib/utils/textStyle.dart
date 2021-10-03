// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(fontWeight: FontWeight.bold),
    color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
  );
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(fontWeight: FontWeight.bold),
    color: Get.isDarkMode ? Colors.white : Colors.black,
  );
}

TextStyle get normalBoldText {
  return GoogleFonts.lato(
    textStyle: TextStyle(fontWeight: FontWeight.bold),
    color: Colors.white,
  );
}

TextStyle get titleTextStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(fontWeight: FontWeight.w400),
    color: Get.isDarkMode ? Colors.white : Colors.black,
  );
}

TextStyle get subTitleTextStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(fontWeight: FontWeight.w400),
    color: Get.isDarkMode ? Colors.white : Colors.black,
    fontSize: 14,
  );
}