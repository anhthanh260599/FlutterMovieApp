import 'package:flutter/material.dart';
import 'package:fluttermovieapp/presentation/app_localization.dart';

extension StringExtension on String {
  String intelliTrim() { // Dùng để cắt chuỗi
    return this.length > 15 ? '${this.substring(0,15)}...' : this;
  }

  String t (BuildContext context) {
    return AppLocalization.of(context)?.translate(this) ?? '';
  }
}