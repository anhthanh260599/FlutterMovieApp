import 'package:flutter/material.dart';
import 'package:fluttermovieapp/common/constants/size_constants.dart';
import 'package:fluttermovieapp/common/extensions/size_extension.dart';
import 'package:fluttermovieapp/presentation/themes/theme_color.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme(); // lấy font

  // Chỉnh màu và font chữ cho mặc định
  static TextStyle get _whitetitleLarge => _poppinsTextTheme?.titleLarge?.copyWith(
    fontSize: Sizes.dimen_20.sp.toDouble(),
    color: Colors.white,
  ) ?? TextStyle(); // Hoặc có thể thêm giá trị mặc định thay vì sử dụng null.

  static TextStyle get whitetitleMedium => _poppinsTextTheme?.titleMedium?.copyWith(
    fontSize: Sizes.dimen_16.sp.toDouble(),
    color: Colors.white
  ) ?? TextStyle();

  static TextStyle get whitebodyMedium => _poppinsTextTheme?.bodyMedium?.copyWith(
    fontSize: Sizes.dimen_14.sp.toDouble(),
    color: Colors.white,
    wordSpacing: 0.25,
    letterSpacing: 0.25,
    height: 1.5
  ) ?? TextStyle();

  static getTextTheme() => TextTheme(
        titleLarge: _whitetitleLarge,
        titleMedium: whitetitleMedium,
        bodyMedium : whitebodyMedium
      );
}

// thêm css cho các chữ
extension ThemeTextExtension on TextTheme {
  TextStyle get royalBluetitleMedium => titleMedium?.copyWith(
    color: AppColor.royalBlue
  ) ?? TextStyle();
}
