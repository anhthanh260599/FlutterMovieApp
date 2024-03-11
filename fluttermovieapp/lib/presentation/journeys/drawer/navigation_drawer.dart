import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermovieapp/common/constants/languages.dart';
import 'package:fluttermovieapp/common/constants/size_constants.dart';
import 'package:fluttermovieapp/common/constants/translation_constants.dart';
import 'package:fluttermovieapp/common/extensions/size_extension.dart';
import 'package:fluttermovieapp/common/extensions/string_extension.dart';
import 'package:fluttermovieapp/presentation/app_localization.dart';
import 'package:fluttermovieapp/presentation/blocs/language/language_bloc.dart';
import 'package:fluttermovieapp/presentation/journeys/drawer/navigation_expand_list_item.dart';
import 'package:fluttermovieapp/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:fluttermovieapp/presentation/movie_app.dart';
import 'package:fluttermovieapp/presentation/widgets/logo.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

class NavigationDrawer extends StatelessWidget {

  const NavigationDrawer();

  @override
  Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),      
              blurRadius: 4      
              )
          ]
           ),
        width: Sizes.dimen_300.w,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: Sizes.dimen_8.h,
                  bottom: Sizes.dimen_18.h,
                  left: Sizes.dimen_8.w,
                  right: Sizes.dimen_8.w
                ),
                child: Logo(
                  height: Sizes.dimen_20.h
                  ),
              ),
              NavigationListItem(
                title: TranslationConstants.favoriteMovies.t(context), 
                onPressed: () {}
              ),
              NavigationExpandedListItem(
                title: TranslationConstants.language.t(context), 
                children: Languages.languages.map((e) => e.value).toList(), // danh sách ngôn ngữ
                onPressed: (index) {
                    BlocProvider.of<LanguageBloc>(context).add(
                      ToggleLanguageEvent(
                        Languages.languages[index]
                      ),
                    );
                }
              ),
                NavigationListItem(
                title: TranslationConstants.feedback.t(context), 
                onPressed: () {}
              ),
                NavigationListItem(
                title: TranslationConstants.about.t(context), 
                onPressed: () {}
              )
              
            ],
          ),
        ),
      );
  }
}