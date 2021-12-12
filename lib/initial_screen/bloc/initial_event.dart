import 'package:equatable/equatable.dart';

abstract class InitialEvent extends Equatable {

  const InitialEvent();

  @override
  List<Object> get props => [];
}


class InitEvent extends InitialEvent{}

class ExitEvent extends InitialEvent{}

class GetEvent extends InitialEvent{
  final int count;

  const GetEvent(this.count);

  @override
  List<Object> get props => [count];

}
