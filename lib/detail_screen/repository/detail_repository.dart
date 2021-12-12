import 'dart:convert';

import 'package:app_comics/models/general_comics_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:app_comics/common/env.dart';

class DetailRepository{

  final urlApi=enviroments.development;
  DetailRepository();

  Future<List<GeneralComicsList>> getComics ({String limit = "15"}) async{
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
    List<GeneralComicsList> comics=[];
    for (var element in dataChild) {
      //name,api_detail_url,volume,image
      GeneralComicsList auxComicItem=GeneralComicsList();
      auxComicItem.name=element["name"];
      auxComicItem.apiDetailUrl=element["api_detail_url"];
      auxComicItem.volume=element["volume"];
      auxComicItem.image=element["image"];
      comics.add(auxComicItem);
    }
    return comics;
  }

}