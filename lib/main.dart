import 'package:app_comics/auth_screen/bloc/auth_event.dart';
import 'package:app_comics/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth_screen/bloc/auth_bloc.dart';
import 'auth_screen/bloc/auth_state.dart';
import 'auth_screen/repository/auth_repository.dart';
import 'firebase_options.dart';
import 'common/general_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final AuthRepository authRepository = AuthRepository();
  runApp(BlocProvider(
    create: (context) => AuthBloc(authRepositoryAux: authRepository),
    child: const ComicsApp(),
  ));
}

class ComicsApp extends StatelessWidget {
  const ComicsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comics App',
      theme: generalTheme(),
      initialRoute: '/',
      routes: routes,
    );
  }
}


