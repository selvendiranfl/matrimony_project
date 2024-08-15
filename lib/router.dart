

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrimony_app/view/bloc/loginBloc/log_in_bloc.dart';
import 'package:matrimony_app/view/bloc/regirationscreen2/registrationscreen2_bloc.dart';
import 'package:matrimony_app/view/bloc/registrationscreen3/registrationscreen3_bloc.dart';
import 'package:matrimony_app/view/bloc/resgitrationscreen1/registration_screen1_bloc.dart';
import 'package:matrimony_app/view/screens/logInScreen.dart';
import 'package:matrimony_app/view/screens/registrationscreen2.dart';
import 'package:matrimony_app/view/screens/regitrationscreen3.dart';
import 'package:matrimony_app/view/screens/registrationscreen1.dart';

import 'helper/CustomPageRoute.dart';

class AppRoutes{
static const String loginscreen = "Login";
static const String registerationscreen1 = "Registerationscreen1";
static const String registerationscreen2 = "Registerationscreen2";
static const String registerationscreen3 = "Registerationscreen3";
}


Route<dynamic> _buildLoginScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildLoginScreen(settings));
}
Route<dynamic> _buildRegisterationScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildRegisterationScreen(settings));
}
Route<dynamic> _buildRegisterationScreen2(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildRegisterationScreen2(settings));
}
Route<dynamic> _buildRegisterationScreen3(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildRegisterationScreen3(settings));
}

Route<dynamic>? getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginscreen:
      return _buildLoginScreen(settings);
    case AppRoutes.registerationscreen1:
      return _buildRegisterationScreen(settings);
    case AppRoutes.registerationscreen2:
      return _buildRegisterationScreen2(settings);
    case AppRoutes.registerationscreen3:
      return _buildRegisterationScreen3(settings);

  }
  return null;
}


class PageBuilder {
  static Widget buildLoginScreen(RouteSettings settings) {
    return BlocProvider(
      create: (BuildContext context) => LogInBloc(),
      child: LogInPage(),
    );
  }
  static Widget buildRegisterationScreen(RouteSettings settings) {
    return BlocProvider(
      create: (BuildContext context) => SignUpBloc(),
      child: SignUpScreen(),
    );
  }
  static Widget buildRegisterationScreen2(RouteSettings settings) {
    return BlocProvider(
      create: (BuildContext context) => Registrationscreen2Bloc(),
      child: Registrationscreen2(),
    );
  }
  static Widget buildRegisterationScreen3(RouteSettings settings) {
    return BlocProvider(
      create: (BuildContext context) => Registrationscreen3Bloc(),
      child: Registrationscreen3(),
    );
  }
}