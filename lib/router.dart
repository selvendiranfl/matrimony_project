

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrimony_app/view/bloc/SignUpBloc/sign_up_bloc.dart';
import 'package:matrimony_app/view/bloc/loginBloc/log_in_bloc.dart';
import 'package:matrimony_app/view/screens/logInScreen.dart';
import 'package:matrimony_app/view/screens/signupScreen.dart';

import 'helper/CustomPageRoute.dart';

class AppRoutes{
static const String loginscreen = "Login";
static const String registerationscreen = "Registerationscreen";
}


Route<dynamic> _buildLoginScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildLoginScreen(settings));
}
Route<dynamic> _buildRegisterationScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildRegisterationScreen(settings));
}


Route<dynamic>? getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginscreen:
      return _buildLoginScreen(settings);
    case AppRoutes.registerationscreen:
      return _buildRegisterationScreen(settings);

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
}