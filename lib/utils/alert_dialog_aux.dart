import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';

class AlertDialogAux {
  final void Function() cancelFunction;
  final void Function() acceptFunction;
  final String title;
  final String description;

  AlertDialogAux(this.cancelFunction, this.acceptFunction, this.title, this.description);

  void exitDialog(BuildContext context){
    if (Platform.isAndroid) {

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
              child: const Text("Cancelar"),
              onPressed:  cancelFunction,
            ),
          TextButton(
              child: const Text("Continuar"),
              onPressed:  acceptFunction,
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
            title: Text(title),
            content: Text(description),
            actions: [
              CupertinoDialogAction(
                  child: const Text("Continuar"),
                  onPressed: acceptFunction
              ),
              CupertinoDialogAction(
                child: const Text("Cancelar"),
                onPressed: cancelFunction
                ,
              )
            ],
          );
        },
      );
    }

  }
}