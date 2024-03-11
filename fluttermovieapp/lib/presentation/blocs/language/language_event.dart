part of 'language_bloc.dart';

sealed class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

// event chuyển đổi ngôn ngữ
class ToggleLanguageEvent extends LanguageEvent {

  final LanguageEntity language;

  const ToggleLanguageEvent(this.language);

  @override
  List<Object> get props => [language.code];

}
