import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermovieapp/presentation/movie_app.dart';
import 'package:fluttermovieapp/di/get_it.dart' as getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  runApp(MovieApp());
}