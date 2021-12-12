
import 'package:app_comics/initial_screen/bloc/inital_bloc.dart';
import 'package:app_comics/initial_screen/bloc/initial_event.dart';
import 'package:app_comics/models/user_model.dart';
import 'package:app_comics/utils/alert_dialog_aux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  _InitialPage createState() => _InitialPage(user);
}

class _InitialPage extends State<InitialPage> {

  _InitialPage(this.userAux);
  final UserModel userAux;

  InitialBloc initialBloc= InitialBloc();

  @override
  void initState(){

  print(userAux);
    initialBloc.add(InitEvent());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Sumario de comics", style: Theme.of(context).textTheme.headline2,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){AlertDialogAux(
                  () => Navigator.of(context).pop(),
                  "Aviso",
                  "Si sales de la app tu sesión cerrará, ¿Estás seguro de salir?",
                  true
                  ).exitDialog(context);
          }
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido ${userAux.displayName}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              '6',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}