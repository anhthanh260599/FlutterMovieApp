import 'dart:convert';
import 'dart:ui';

import 'package:fluttermovieapp/data/core/api_constants.dart';
import 'package:fluttermovieapp/di/get_it.dart';
import 'package:fluttermovieapp/presentation/blocs/language/language_bloc.dart';
import 'package:http/http.dart';

class ApiClient {
  final Client _client;

  final LanguageBloc _languageBloc; // Thêm một trường _languageBloc

  ApiClient(this._client, this._languageBloc);


  dynamic get(String path) async {
    final response = await _client.get(
      // Uri.parse('${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}&language=${_languageBloc.getCurrentLocale().languageCode}'),
      Uri.parse('${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}&language=${_languageBloc.state.locale.languageCode}'),
      headers: {
        'Content-Type': 'application/json',
      }
    );

    if(response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception(response.reasonPhrase);
    }
  }
}