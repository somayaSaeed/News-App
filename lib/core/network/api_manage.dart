import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/model/NewsResponse.dart';
import 'package:news_app/core/model/SourceResponse.dart';
import 'package:news_app/core/network/api_constant.dart';

class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=221aa0419d1e4e5aa6ae49568a9175df

  static Future<SourceResponse?> getSource(String categoryId) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.sources,
      {
        'apiKey': ApiConstants.api,
        'category': categoryId,
      },
    );

    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

//https://newsapi.org/v2/everything?q=bitcoin&apiKey=221aa0419d1e4e5aa6ae49568a9175df

  static Future<NewsResponse> getNewsBySourceId(String? sourceId ) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.newsApi,
      {
        'apiKey': ApiConstants.api,
        'sources': sourceId,

      },
    );
    try {

      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      print('Error during API call: $e');

      rethrow;
    }
  }

  static Future<NewsResponse?> searchNews(String query) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.sources,
      {
        'apiKey': ApiConstants.api,
        'q': query,

      },
    );
    var response = await http.get(url);
    try {
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      print('Error during API call: $e');

      rethrow;
    }
  }



}
