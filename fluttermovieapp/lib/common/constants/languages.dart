import 'package:fluttermovieapp/domain/entities/language_entity.dart';

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(code: "en", value: "English", languageKey: "en"),
    LanguageEntity(code: "vi", value: "Tiếng Việt", languageKey: "vi"),
  ];
}