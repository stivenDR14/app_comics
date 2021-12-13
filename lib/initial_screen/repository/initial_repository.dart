import 'dart:convert';

import 'package:app_comics/models/general_comics_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:app_comics/common/env.dart';

class InitialRepository{
  final FirebaseAuth _auth=FirebaseAuth.instance;

  final urlApi=enviroments.development;
  InitialRepository();

  Future<List<GeneralComicsList>> getComics ({String limit = "15"}) async{
    final queryParameters = {
      'api_key': urlApi.keyApi,
      'format':  urlApi.jsonFormat,
      'field_list': urlApi.params,
      'limit': limit,
      'filter': 'name:x-men',
      'sort': 'cover_date:desc'
    };
    final url = Uri.http(urlApi.apiHost, urlApi.category,queryParameters);
    final resp = await http.get(url);
    final Map<String, dynamic> data = json.decode(resp.body);
    final List<dynamic> dataChild = data["results"];
    List<GeneralComicsList> comics=dataChild.map((i)=>GeneralComicsList.fromJson(i)).toList();

    return comics;
  }

  Future<void> singOut() async{
    return _auth.signOut();
  }

}