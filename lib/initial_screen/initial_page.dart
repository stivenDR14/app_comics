
import 'package:app_comics/initial_screen/bloc/inital_bloc.dart';
import 'package:app_comics/initial_screen/bloc/initial_event.dart';
import 'package:app_comics/initial_screen/widgets/comic_view.dart';
import 'package:app_comics/models/user_model.dart';
import 'package:app_comics/utils/alert_dialog_aux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/initial_state.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key, required this.user}) : super(key: key);

  final String user;

  @override
  _InitialPage createState() => _InitialPage(user);
}

class _InitialPage extends State<InitialPage> {

  _InitialPage(this.userAux);
  final String userAux;

  InitialBloc initialBloc= InitialBloc();

  bool isGrid=false;

  int contComics=15;

  final ScrollController _controller= ScrollController();
  @override
  void initState(){
    initialBloc.add(InitEvent());
    _controller.addListener(scrollListener);
  }

  scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        contComics=contComics+15;
      });
      initialBloc.add(GetEvent(contComics));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).focusColor,
        title: Text("Sumario de comics", style: Theme.of(context).textTheme.headline2,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){AlertDialogAux(
                  () => Navigator.of(context).pop(),
                  "Aviso",
                  "Si sales de la app tu sesión cerrará, ¿Estás seguro de salir?",
                  true
                  ).exitDialog(context);
          }
        ),
      ),
      body: BlocBuilder(
            bloc: initialBloc,
            builder: (BuildContext context, state) {
              if (state is Loading) {
                return Column(
                  children:  [
                    const LinearProgressIndicator(
                      minHeight: 20,
                    ),
                    SizedBox(height: mediaQuery.height*0.3),
                    contComics>15?Text("Cargando más comics...",style: Theme.of(context).textTheme.headline1):Text("Bienvenido(a) $userAux",style: Theme.of(context).textTheme.headline1)
                  ],
                );
              }
              if(state is EmptyState){
                Future.delayed(Duration.zero, () async {
                  Navigator.pushNamed(context, '/');
                });
                return Container();
              }
              if (state is Success){

               return isGrid?Stack(
                 children: [
                   SingleChildScrollView(
                     controller: _controller,
                     child: GridView.count(
                       physics: NeverScrollableScrollPhysics(),
                       scrollDirection: Axis.vertical,
                       shrinkWrap: true,
                       crossAxisCount: 3,
                       children: List.generate(state.data.length, (index) {

                         return ComicView(mediaQuery: mediaQuery,itemComic: state.data.elementAt(index),isGrid:true);
                       }),
                     ),
                   ),
                   Stack(
                       children: [
                         Positioned(
                           bottom: 0,
                           child: IgnorePointer(
                             child: Container(
                               clipBehavior: Clip.none,
                               decoration: BoxDecoration(
                                   gradient: LinearGradient(
                                     begin: Alignment.topCenter,
                                     end: Alignment.bottomCenter,
                                     colors: [
                                       Theme.of(context).focusColor.withOpacity(0.01),
                                       Theme.of(context).splashColor.withOpacity(0.9),
                                     ],
                                   )
                               ),
                               width: mediaQuery.width,
                               height: mediaQuery.height*0.35,
                             ),
                           ),
                         ),
                       ]
                   )
                 ],
               ): Stack(
                 children: [
                   ListView(
                     controller: _controller,
                      children: state.data.map((item) => Center(
                        child: ComicView(mediaQuery: mediaQuery,itemComic: item,isGrid: false),
                      )).toList(),
                    ),
                   Stack(
                       children: [
                         Positioned(
                           bottom: 0,
                           child: IgnorePointer(
                             child: Container(
                               clipBehavior: Clip.none,
                               decoration: BoxDecoration(
                                   gradient: LinearGradient(
                                     begin: Alignment.topCenter,
                                     end: Alignment.bottomCenter,
                                     colors: [
                                       Theme.of(context).focusColor.withOpacity(0.01),
                                       Theme.of(context).splashColor.withOpacity(0.7),
                                     ],
                                   )
                               ),
                               width: mediaQuery.width,
                               height: mediaQuery.height*0.35,
                             ),
                           ),
                         ),
                       ]
                   )
                 ],
               );
              }
              return Container();
            }
        ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Theme.of(context).focusColor,
            onPressed: (){
              setState(() {
                isGrid= !isGrid;
              });
            },
            child: isGrid? const Icon(Icons.list):const Icon(Icons.grid_3x3),
          ),
          SizedBox(
            width: mediaQuery.width*0.6,
          ),
          FloatingActionButton(
            heroTag: null,
            backgroundColor: Theme.of(context).focusColor,
            onPressed: (){initialBloc.add(ExitEvent());},
            child: const Icon(Icons.exit_to_app),
          ),
        ]
      ),
    );
  }
}