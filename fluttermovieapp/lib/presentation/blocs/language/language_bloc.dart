import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttermovieapp/common/constants/languages.dart';
import 'package:fluttermovieapp/data/core/api_clients.dart';
import 'package:fluttermovieapp/domain/entities/language_entity.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageLoaded(Locale(Languages.languages[0].code))) { // 0 là Mặc định tiếng Anh, 1 là tiếng Việt
    on<LanguageEvent>((event, emit) {
      // TODO: implement event handler

      if(event is ToggleLanguageEvent) {
        emit(LanguageLoaded(Locale(event.language.code)));
      }
    });
  }
}
