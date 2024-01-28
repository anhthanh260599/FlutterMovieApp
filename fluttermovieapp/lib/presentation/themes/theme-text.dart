import 'package:flutter/material.dart';
import 'package:fluttermovieapp/common/constants/size_constants.dart';
import 'package:fluttermovieapp/common/extensions/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadline6 => _poppinsTextTheme?.headline6?.copyWith(
    fontSize: Sizes.dimen_20.sp.toDouble(),
    color: Colors.white,
  ) ?? TextStyle(); // Hoặc có thể thêm giá trị mặc định thay vì sử dụng null.

  static getTextTheme() => TextTheme(
        headline6: _whiteHeadline6,
      );
}