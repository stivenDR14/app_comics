import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {

  const DetailEvent();

  @override
  List<Object> get props => [];
}


class InitEvent extends DetailEvent{
  final String url;

  const InitEvent(this.url);

  @override
  List<Object> get props => [url];

}
