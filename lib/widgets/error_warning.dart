import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorWarning extends StatelessWidget{
  const ErrorWarning({Key? key, required this.description, required this.isError, this.showButton=true}) : super(key: key);

  final String description;
  final bool isError;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
      Size mediaQuery= MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          showButton?SizedBox(
            height: mediaQuery.height*0.1,
          ):Container(),
          showButton?FloatingActionButton(
            heroTag: null,
            backgroundColor: Theme.of(context).focusColor,
            onPressed: (){
              Navigator.pushNamed(context, '/');
            },
            child:const Icon(Icons.arrow_back),
          ):Container(),
          SizedBox(
            height: mediaQuery.height*0.3,
          ),
          Row(
            children: [
              Icon(
                isError?Icons.error:Icons.warning,
                size: 40.0,
                color: Theme.of(context).primaryColorDark
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.headline2
              )
            ],
          ),
        ],
      ),
    );
  }

}