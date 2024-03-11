import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttermovieapp/common/constants/languages.dart';
import 'package:fluttermovieapp/common/sceenutils/sceenutils.dart';
import 'package:fluttermovieapp/di/get_it.dart';
import 'package:fluttermovieapp/presentation/app_localization.dart';
import 'package:fluttermovieapp/presentation/blocs/language/language_bloc.dart';
import 'package:fluttermovieapp/presentation/journeys/home/home_screen.dart';
import 'package:fluttermovieapp/presentation/themes/theme-text.dart';
import 'package:fluttermovieapp/presentation/themes/theme_color.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  late LanguageBloc _languageBloc;

  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstant<LanguageBloc>();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Khởi tạo màn hình
    ScreenUtil.init();
    return BlocProvider<LanguageBloc>.value(
        value: _languageBloc,
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            if (state is LanguageLoaded) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Movie App',
                theme: ThemeData(
                  primaryColor: AppColor.vulcan,
                  scaffoldBackgroundColor: AppColor.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0),
                ),
                supportedLocales:
                    Languages.languages.map((e) => Locale(e.code)).toList(),
                locale: state.locale,
                localizationsDelegates: [
                  AppLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                home: HomeScreen(),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}