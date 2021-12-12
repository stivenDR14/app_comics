import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthEvent extends Equatable {

  const AuthEvent();

  @override
  List<Object> get props => [];
}


class Submitted extends AuthEvent{
  final BuildContext context;
  final String email;
  final String? displayName;
  final String password;
  final String? newPassword;
  final bool isRegisterMode;


  const Submitted(this.context, this.displayName, this.password, this.newPassword, this.isRegisterMode, this.email);

  @override
  List<Object> get props => [email,password, isRegisterMode];

}
