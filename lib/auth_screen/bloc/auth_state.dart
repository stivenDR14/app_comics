import 'package:app_comics/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {

  const AuthState();

  @override
  List<Object> get props => [];
}

class InitState extends AuthState{
  const InitState();
}

class EmptyState extends AuthState{

  const EmptyState();
}

class Success extends AuthState{
  final UserModel? user;
  const Success(this.user);
}

class Fail extends AuthState{
  final String message;
  const Fail(this.message);
}

class Loading extends AuthState{
  const Loading();
}

class Warning extends AuthState{
  final String message;
  const Warning(this.message);
}

class Uninitialized extends AuthState{
  final String message;
  const Uninitialized(this.message);
}

