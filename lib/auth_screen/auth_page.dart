

import 'package:app_comics/auth_screen/repository/auth_repository.dart';
import 'package:app_comics/auth_screen/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc.dart';

class AuthPage extends StatelessWidget{
  final AuthRepository authRepository = AuthRepository();

  AuthPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(authRepositoryAux: authRepository),
        child: const LoginForm(),
      ),

    );
  }

}