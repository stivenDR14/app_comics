import 'dart:convert';

import 'package:app_comics/models/general_comics_list.dart';
import 'package:http/http.dart' as http;
import 'package:app_comics/common/env.dart';

class InitialRepository{

  final urlApi=enviroments.development;
  InitialRepository();

  Future<List<GeneralComicsList>> getComics ({String limit = "10"}) async{
    final queryParameters = {
      'api_key': urlApi.keyApi,
      'format':  urlApi.jsonFormat,
      'field_list': urlApi.params,
      'limit': limit
    };
    final url = Uri.http(urlApi.apiHost, urlApi.category,queryParameters);
    final resp = await http.get(url);
    final Map<String, dynamic> data = json.decode(resp.body);
    final List<dynamic> dataChild = data["results"];
    List<GeneralComicsList> result= data.entries.map((e) => GeneralComicsList(name: e.value)).toList();
    return result;
  }

}