import 'dart:convert';

import 'package:app_comics/models/comic.dart';
import 'package:app_comics/models/general_comics_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:app_comics/common/env.dart';

class DetailRepository{

  final urlApi=enviroments.development;
  DetailRepository();

  Future<Comic> getDetailComic (String pathData) async{
    final queryParameters = {
      'api_key': urlApi.keyApi,
      'format':  urlApi.jsonFormat,
    };
    List<String> finalPath= pathData.split("/");

    final url = Uri.http(urlApi.apiHost, "api/issue/"+finalPath[5],queryParameters);
    final resp = await http.get(url);
    final Map<String, dynamic> data = json.decode(resp.body);

    final comics = Comic.fromJson(data["results"]);

    return comics;
  }

}