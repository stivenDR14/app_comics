import 'package:app_comics/initial_screen/repository/initial_repository.dart';
import 'package:app_comics/models/general_comics_list.dart';
import 'package:bloc/bloc.dart';

import 'initial_event.dart';
import 'initial_state.dart';

class InitialBloc extends Bloc<InitialEvent,InitialState> {
  InitialRepository initialRepository= InitialRepository();

  InitialBloc();

  @override
  InitialState get initialState => const InitState();

  @override
  Stream<InitialState> mapEventToState(InitialEvent event) async*{
    List<GeneralComicsList> booksList;
    yield const Loading();
    if(event is InitEvent){
      booksList= await initialRepository.getComics();
      yield Success(booksList);
    }
  }



}