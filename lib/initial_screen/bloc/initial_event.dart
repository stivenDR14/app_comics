import 'package:equatable/equatable.dart';

abstract class InitialEvent extends Equatable {

  const InitialEvent();

  @override
  List<Object> get props => [];
}


class InitEvent extends InitialEvent{}
