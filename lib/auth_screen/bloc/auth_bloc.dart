import 'package:app_comics/auth_screen/repository/auth_repository.dart';
import 'package:app_comics/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

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
    if(event is InitEvent){
      try{
        final isSignedIn = authRepository.isSignedIn();
        if(isSignedIn){
          final user = await authRepository.getUser();//se usa??
          yield Authenticated(user);
        }
        else{
          yield const Unauthenticated("No autenticado");
        }
      }catch(_){
        yield const Uninitialized("No inicializado");
      }
    }

    if(event is Submitted){
      if(event.email.isNotEmpty){
        if(event.password==event.newPassword || event.password.isNotEmpty || event.newPassword!.isNotEmpty){
          bool mode=event.isRegisterMode;
          if(mode){
            await authRepository.signUp(event.email, event.password, event.displayName).then((value)
            async*{
              yield  const Uninitialized("Por favor inicia sesión para acceder a los comics...");
            }).catchError((error) async*{
              yield const Fail("Ha sucedido un error");
            });
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