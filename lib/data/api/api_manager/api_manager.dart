
import 'dart:convert';

import 'package:http/http.dart'as http;

import '../model/articles_response/article_response.dart';
import '../model/sources_response/source_response.dart';

class  ApiManager{
  static const String _baseUrl = 'newsapi.org';
  static const String _apiKey = '340bdae8499143f299cb22d0c68baa04';
  static const String sourcesEndPoint = '/v2/top-headlines/sources';
  static const String articlesEndPoint = '/v2/everything';

  static Future<SourceResponse>getSources(String categoryItd)async{
    Uri url = Uri.https(_baseUrl,sourcesEndPoint,{
      'apiKey':_apiKey,
      'category':categoryItd,
    });
    http.Response serverResponse = await http.get(url); // make a network Request
    Map<String, dynamic> json = jsonDecode(serverResponse.body); // convert from string to json
    SourceResponse sourcesResponse = SourceResponse.fromJson(json);
    return sourcesResponse;

  }

  static Future<ArticleResponse>getArticles(String sourceId)async{
    Uri url = Uri.https(_baseUrl,articlesEndPoint,{
      'apiKey': _apiKey,
      'sources':sourceId,
    });
    http.Response serverResponse = await http.get(url);
    Map<String,dynamic> json = jsonDecode(serverResponse.body);

    ArticleResponse articlesResponse = ArticleResponse.fromJson(json);
    return articlesResponse;

  }
}