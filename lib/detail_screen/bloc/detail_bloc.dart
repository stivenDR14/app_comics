import 'package:app_comics/detail_screen/repository/detail_repository.dart';
import 'package:app_comics/detail_screen/bloc/detail_event.dart';
import 'package:app_comics/detail_screen/bloc/detail_state.dart';
import 'package:app_comics/models/comic.dart';
import 'package:bloc/bloc.dart';


class DetailBloc extends Bloc<DetailEvent,DetailState> {
  DetailRepository detailRepository= DetailRepository();

  DetailBloc();

  @override
  DetailState get initialState => const InitState();


  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async*{
    Comic comicDetail;

    if(event is InitEvent){
      yield const Loading();
      try{
        comicDetail= await detailRepository.getDetailComic(event.url);

        Map<String, dynamic> mapGeneralData=comicDetail.generalDataToMap();

        Map<String,List<String>> mapSpecificItems=comicDetail.itemsToArray();

        List arrayAux=[mapGeneralData,mapSpecificItems,mapGeneralData["Imagen"]];
        yield Success(arrayAux);
      }catch(error){
        yield const Fail("He habido un error");
      }



    }

  }




}