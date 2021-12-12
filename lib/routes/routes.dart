import 'package:app_comics/auth_screen/auth_page.dart';
import 'package:app_comics/detail_screen/detail_page.dart';
import 'package:app_comics/initial_screen/initial_page.dart';
import 'package:app_comics/models/user_model.dart';
import 'package:flutter/widgets.dart';


final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => AuthPage(),
  "/Main": (BuildContext context) => InitialPage(user: ModalRoute.of(context)!.settings.arguments as UserModel),
  "/Detail": (BuildContext context) => const DetailPage(),
};