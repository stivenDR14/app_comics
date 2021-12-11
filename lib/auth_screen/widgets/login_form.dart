
import 'package:app_comics/auth_screen/bloc/auth_bloc.dart';
import 'package:app_comics/auth_screen/bloc/auth_event.dart';
import 'package:app_comics/auth_screen/bloc/auth_state.dart';
import 'package:app_comics/auth_screen/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget{
  const LoginForm({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginForm();
  }

}

class _LoginForm extends State<LoginForm>{

  late TextEditingController _emailController;
  late TextEditingController _passController;
  late TextEditingController _passConfirmController;
  late TextEditingController _nameController;
  final AuthRepository authRepository = AuthRepository();
  late AuthBloc _authBloc;
  late List<bool> _selections;

  @override
  void initState() {
    super.initState();
    _selections=[true, false];
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _emailController= TextEditingController();
    _passController= TextEditingController();
    _passConfirmController= TextEditingController();
    _nameController= TextEditingController();

  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _passConfirmController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _onSubmitRegister(BuildContext context) {
    _authBloc.add(Submitted(context,_nameController.text, _passController.text, _passConfirmController.text, true, _emailController.text));
  }

  void _onSubmitLogin(BuildContext context) {
    _authBloc.add(Submitted(context,_nameController.text, _passController.text, _passConfirmController.text, false, _emailController.text));
  }


  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Visibility(
          visible: true,
          child: BlocBuilder(
            bloc: _authBloc,
            builder: (BuildContext context, state) {
              if (state is Loading) {
                return const LinearProgressIndicator(
                  minHeight: 20,
                );
              }
              return Container();
            }
            ),
        ),
        title: Column(
          children: [
            Text("¡Ingresa o registrate!", style: Theme.of(context).textTheme.headline2),
          ],
        ),
      ),
      body: BlocBuilder(
        bloc: _authBloc,
        builder: (BuildContext context, state) {
          if(state is Uninitialized){
            return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: mediaQuery.height*0.05),
                  child: Column(
                    children: [
                      SizedBox(
                        height: mediaQuery.height*0.1,
                      ),
                      ToggleButtons(
                        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                        isSelected: _selections,
                        children: [
                          SizedBox(
                              width: mediaQuery.width*0.3,
                              child: const Icon(Icons.supervised_user_circle, size: 40.0,)),
                          SizedBox(
                              width: mediaQuery.width*0.3,
                              child: const Icon(Icons.assignment_ind_outlined,
                                  size: 40.0))
                        ],
                        onPressed: ((int index){
                          int cont=0;
                          setState(() {
                            for (var element in _selections) {
                              _selections[cont]=!_selections[cont];
                              cont=cont+1;
                            }
                          });
                        }),
                      ),
                      SizedBox(
                        height: mediaQuery.height*0.05,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Correo electrónico *',
                            style: Theme.of(context).textTheme.headline2),
                      ),
                      TextField(
                        style: Theme.of(context).textTheme.bodyText2,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          hintText: 'ejemplo@comics-app.com',
                          border: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(15),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height*0.05,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Contraseña *',
                            style: Theme.of(context).textTheme.headline2),
                      ),
                      TextField(
                        style: Theme.of(context).textTheme.bodyText2,
                        controller: _passController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          hintText: '********',
                          border: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(15),
                        ),
                      ),
                      _selections[1]?Container():SizedBox(
                        height: mediaQuery.height*0.05,
                      ),
                      _selections[1]?Container():Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Confirmación de contraseña *',
                            style: Theme.of(context).textTheme.headline2),
                      ),
                      _selections[1]?Container():TextField(
                        style: Theme.of(context).textTheme.bodyText2,
                        controller: _passConfirmController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          hintText: '********',
                          border: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(15),
                        ),
                      ),
                      _selections[1]?Container():
                      SizedBox(
                        height: mediaQuery.height*0.05,
                      ),
                      _selections[1]?Container():Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Nombre de usuario',
                            style: Theme.of(context).textTheme.headline2),
                      ),
                      _selections[1]?Container():TextField(
                        style: Theme.of(context).textTheme.bodyText2,
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintStyle: Theme.of(context).textTheme.bodyText1,
                          hintText: '_spideverse_616',
                          border: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(15),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height*0.05,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _selections[1]?_onSubmitLogin(context):_onSubmitRegister(context);
                          }, child: Text(_selections[1]?'Iniciar sesión':'Registrarse',
                        style: Theme.of(context).textTheme.headline2,)),
                      SizedBox(
                        height: mediaQuery.height*0.05,
                      ),
                      Container(
                        margin: EdgeInsets.all(mediaQuery.height*0.05),
                        child: Text(
                          '* Campos requeridos',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                )

            );
          }
          if(state is Success){
            Navigator.pushNamed(context, '/Main');
          }

          if(state is Fail){

            return Text("Falló");
          }

          if(state is Warning){

            return Text(state.message);
          }

          return const Center(child: Text("Cargando"));
        },),

    );
  }

}