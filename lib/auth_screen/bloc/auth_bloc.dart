import 'package:app_comics/auth_screen/repository/auth_repository.dart';
import 'package:app_comics/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:flutter/material.dart';
class AuthBloc extends Bloc<AuthEvent,AuthState> {

  final  AuthRepository authRepository;

  AuthBloc({required AuthRepository authRepositoryAux})
      :authRepository = authRepositoryAux;

  @override
  AuthState get initialState => const Uninitialized("No inicializado");

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async*{
    UserModel user=UserModel(email: null, displayName: null, uid: null);
    yield const Loading();

    if(event is Submitted){
      if(event.email.isNotEmpty){
        if(event.password==event.newPassword || event.password.isNotEmpty || event.newPassword!.isNotEmpty){
          bool mode=event.isRegisterMode;
          if(mode){
            try{
              await authRepository.signUp(event.email, event.password, event.displayName);
              ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(
                content: Text("Registro completado, inicia sesión para acceder"),
              ));
              yield  const Uninitialized("inicia sesión para continuar");
            }catch(error){
              yield const Fail("Ha sucedido un error");
            }
          }else{
            try{
              var result= await authRepository.signInWithCredentials(event.email , event.password);
              user.displayName=result.user!.displayName;
              user.email=result.user!.email;
              user.uid=result.user!.uid;
              yield  Success(user);
            }catch(error){
              yield const Fail("Ha sucedido un error");
            }

          }
        }else{
          yield const Warning("Las contraseñas deben ser iguales y no deben estar vacias");
        }
      }else{
        yield const Warning("Ingresa un correo válido");
      }



    }

  }



}