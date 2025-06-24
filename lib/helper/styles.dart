import 'package:flutter/material.dart';

abstract class Styles {
  static const Color PRIMARY_COLOR = Color(0xff34A853);
  static const Color ACCENT_COLOR = Color(0xFF13b36f);
  static const Color HIGHLIGHT_COLOR = Color(0xffE9EAF5);
  static const Color SCAFFOLD_COLOR = Color(0xFFffffff);
  static const Color BORDER_COLOR = Color(0xffD0D2D7);
  static const Color GREY_TEXT_COLOR = Color(0xff7A797A);

  static const Color BLACK_COLOR = Color(0xff000000);
  static const Color DARK_GREY_COLOR = Color(0xff6A6A6A);
  static const Color LIGHT_GREY_COLOR = Color(0xffFAFAFA);
  static const Color GREY_COLOR = Color(0xff9CA2AC);
  static const Color LIGHT_GREY_BORDER = Color(0XFFEEEEEE);
  static const Color WHITE_COLOR = Color(0xffFFFFFF);

  static const List<Color> BUTTON_GRADIENT = [
    ACCENT_COLOR, PRIMARY_COLOR,
  ];

  static const SCREEN_PADDING = const EdgeInsets.symmetric(horizontal: 16, vertical: 20);
  static const HORIZONTAL_PADDING = const EdgeInsets.symmetric(horizontal: 16, vertical: 20);
  static const VERTICAL_PADDING = const EdgeInsets.symmetric(horizontal: 16, vertical: 20);

  static const String FONT_EN = 'en';
  static const String FONT_AR = 'ar';
  static BorderRadius borderRadius = BorderRadius.circular(10.0);

  static Widget divider({double? ver, double? hor, double? thickness}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hor ?? 0, vertical: ver ?? 0),
      child: Divider(color: Colors.grey[300], thickness: thickness ?? 0.5, height: 4),
    );
  }
}