part of 'language_bloc.dart';

sealed class LanguageState extends Equatable {
    final Locale locale;

  const LanguageState(this.locale);
  
  @override
  List<Object> get props => [locale];
}

class LanguageLoaded extends LanguageState {
  final Locale locale;

  const LanguageLoaded(this.locale) : super(locale);

  @override
  // TODO: implement props
  List<Object> get props => [locale];

}