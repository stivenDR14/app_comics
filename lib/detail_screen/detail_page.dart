

import 'package:app_comics/detail_screen/bloc/detail_bloc.dart';
import 'package:app_comics/widgets/error_warning.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/detail_event.dart';
import 'bloc/detail_state.dart';

class DetailPage extends StatefulWidget{
  const DetailPage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailPage(url);
  }

}

class _DetailPage extends State<DetailPage>{

  _DetailPage(this._url);

  final String _url;

  DetailBloc detailBloc= DetailBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailBloc.add(InitEvent(_url));
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder(bloc: detailBloc,
          builder: (BuildContext context, state){
            if (state is Success){
              Map<String, dynamic> generalData=state.data[0];
              Map<String, List<String>> categoriesData=state.data[1];
              List<Widget> widgetListGeneral=ListTile.divideTiles( //          <-- ListTile.divideTiles
                  context: context,
                  tiles: generalData.entries.map<Widget>((item) => item.value!=null?ListTile(
                    title:  Text(item.key,
                        style: Theme.of(context).textTheme.bodyText1),
                    subtitle:  Text(item.value.toString(),
                        style: Theme.of(context).textTheme.bodyText2),
                  ):Container()).toList()
              ).toList();

              List<Widget> widgetListCategories=ListTile.divideTiles( //          <-- ListTile.divideTiles
                  context: context,
                  tiles: categoriesData.entries.map<Widget>((item) => item.value.isNotEmpty?ListTile(
                    title:  Text(item.key,
                        style: Theme.of(context).textTheme.bodyText1),
                    subtitle:  Text(item.value.join(","),
                        style: Theme.of(context).textTheme.bodyText2),
                  ):Container()).toList()
              ).toList();
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: mediaQuery.height*0.1,
                      ),
                      Text("Datos generales", style: Theme.of(context).textTheme.headline2),
                      SizedBox(height: mediaQuery.height*0.03),
                      state.data[2]!=null?ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child: Image.network(
                            state.data[2],
                            height: 150,
                            fit:BoxFit.fill
                        ),
                      ):Container(),
                    ]+widgetListGeneral+ widgetListCategories,
                  ),
                ),
              );
            }
            if(state is Fail){

              return ErrorWarning(description: state.message, isError: true, showButton: false,);
            }

            if(state is Warning){

              return ErrorWarning(description: state.message, isError: false, showButton: false,);
            }

            return const LinearProgressIndicator(
              minHeight: 20,
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        backgroundColor: Theme.of(context).focusColor,
        onPressed: (){
          Navigator.of(context).pop();
        },
        child:const Icon(Icons.arrow_back),
      ),
    );
  }

}