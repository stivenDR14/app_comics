import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorWarning extends StatelessWidget{
  const ErrorWarning({Key? key, required this.description, required this.isError}) : super(key: key);

  final String description;
  final bool isError;

  @override
  Widget build(BuildContext context) {
      Size mediaQuery= MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary:Theme.of(context).primaryColorDark,
                backgroundColor: Theme.of(context).disabledColor,
              ),
              onPressed: (){
              Navigator.pushNamed(context, '/');
            }, child: Text(
                    "Volver",
                    style: Theme.of(context).textTheme.headline2
                )),
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