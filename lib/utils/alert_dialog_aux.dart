import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform, exit;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AlertDialogAux {
  final void Function() acceptFunction;
  final String title;
  final String description;
  final bool isExitMode;

  AlertDialogAux(this.acceptFunction, this.title, this.description, this.isExitMode);

  void exitDialog(BuildContext context){
    if (Platform.isAndroid) {

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text(title, style: Theme.of(context).textTheme.headline2,),
        content: Text(description, style: Theme.of(context).textTheme.bodyText1),
        actions: [
          TextButton(
              child:  Text("Cancelar",  style: Theme.of(context).textTheme.bodyText2),
              onPressed:  (){Navigator.of(context).pop();}
            ),
          TextButton(
              child: Text("Continuar",  style: Theme.of(context).textTheme.bodyText2),
              onPressed:  isExitMode?exitApp:acceptFunction,
            ),
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } else if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title, style: Theme.of(context).textTheme.headline2,),
            content: Text(description, style: Theme.of(context).textTheme.bodyText1),
            actions: [
              CupertinoDialogAction(
                  child: Text("Continuar",  style: Theme.of(context).textTheme.bodyText2),
                  onPressed: isExitMode?exitApp:acceptFunction
              ),
              CupertinoDialogAction(
                child: Text("Cancelar", style: Theme.of(context).textTheme.bodyText2),
                onPressed: (){Navigator.of(context).pop();}
                ,
              )
            ],
          );
        },
      );
    }

  }

  void exitApp(){
    if (Platform.isAndroid){
      Future.delayed(const Duration(milliseconds: 500), () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      });
    }
    else if (Platform.isIOS){
      Future.delayed(const Duration(milliseconds: 500), () {
        exit(0);
      });
    }
  }
}