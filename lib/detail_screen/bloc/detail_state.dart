import 'package:app_comics/models/comic.dart';
import 'package:app_comics/models/general_comics_list.dart';
import 'package:equatable/equatable.dart';

abstract class DetailState extends Equatable {

  const DetailState();

  @override
  List<Object> get props => [];
}

class InitState extends DetailState{
  const InitState();
}

class EmptyState extends DetailState{
  const EmptyState();
}

class Success extends DetailState{
  final  List data;
  const Success(this.data);
}

class Fail extends DetailState{
  final String message;
  const Fail(this.message);
}

class Loading extends DetailState{
  const Loading();
}

class Warning extends DetailState{
  final String message;
  const Warning(this.message);
}