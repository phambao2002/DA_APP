import 'package:flutter/material.dart';

const double kDefaultBorderRaduis = 20;
const double kDefaultPadding = 25.0;
const kMain = Color(0xff00ad59);
const kAccent = Color(0xff1ca800);
const kSecondary = Color(0xff626463);
const kWhite = Color(0xffffffff);
hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

List<String> bottomPageKeys = ['/', '/', '/', '/account'];
