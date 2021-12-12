import 'package:app_comics/models/general_comics_list.dart';
import 'package:equatable/equatable.dart';

abstract class InitialState extends Equatable {

  const InitialState();

  @override
  List<Object> get props => [];
}

class InitState extends InitialState{
  const InitState();
}

class EmptyState extends InitialState{
  const EmptyState();
}

class Success extends InitialState{
  final  List<GeneralComicsList> data;
  const Success(this.data);
}

class Fail extends InitialState{
  final String message;
  const Fail(this.message);
}

class Loading extends InitialState{
  const Loading();
}

class Warning extends InitialState{
  final String message;
  const Warning(this.message);
}