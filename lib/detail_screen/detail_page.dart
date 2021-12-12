
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget{
  const DetailPage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailPage(url);
  }

}

class _DetailPage extends State<DetailPage>{

  _DetailPage(this._url);

  final String _url;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: const Text("Detalle"),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        backgroundColor: Theme.of(context).focusColor,
        onPressed: (){
          Navigator.of(context).pop();
        },
        child:const Icon(Icons.arrow_back),
      ),
    );
  }

}