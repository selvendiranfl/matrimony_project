

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrimony_app/view/bloc/homescreen/homescreenbloc_bloc.dart';
import 'package:matrimony_app/view/bloc/loginBloc/log_in_bloc.dart';
import 'package:matrimony_app/view/bloc/mailboxscreen/mailbox_bloc.dart';
import 'package:matrimony_app/view/bloc/matchesscreen/matchesscreen_bloc.dart';
import 'package:matrimony_app/view/bloc/profileDetailScreenBloc/profile_detail_screen_bloc.dart';
import 'package:matrimony_app/view/bloc/regirationscreen2/registrationscreen2_bloc.dart';
import 'package:matrimony_app/view/bloc/registrationscreen3/registrationscreen3_bloc.dart';
import 'package:matrimony_app/view/bloc/resgitrationscreen1/registration_screen1_bloc.dart';
import 'package:matrimony_app/view/screens/HomeScreen.dart';
import 'package:matrimony_app/view/screens/PremiumAddScreen.dart';
import 'package:matrimony_app/view/screens/logInScreen.dart';
import 'package:matrimony_app/view/screens/profileDetailScreen.dart';
import 'package:matrimony_app/view/screens/registrationscreen2.dart';
import 'package:matrimony_app/view/screens/regitrationscreen3.dart';
import 'package:matrimony_app/view/screens/registrationscreen1.dart';

import 'helper/CustomPageRoute.dart';
import 'model/userprofilemodel.dart';

class AppRoutes{
static const String loginscreen = "Login";
static const String registerationscreen1 = "Registerationscreen1";
static const String registerationscreen2 = "Registerationscreen2";
static const String registerationscreen3 = "Registerationscreen3";
static const String HomeScreen = "HomeScreen";
static const String ProfileDetailScreen = "ProfileDetailScreen";
static const String PremiumScreen = "PremiumScreen";
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
Route<dynamic> _buildHomeScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildHomeScreen(settings));
}
Route<dynamic> _buildProfileDetailScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildProfileDetailScreen(settings));
}
Route<dynamic> _buildPremiumScreen(RouteSettings settings) {
  return CustomPageRoute(child: PageBuilder.buildPremiumScreen(settings));
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
    case AppRoutes.HomeScreen:
      return _buildHomeScreen(settings);
    case AppRoutes.ProfileDetailScreen:
      return _buildProfileDetailScreen(settings);
      case AppRoutes.PremiumScreen:
      return _buildPremiumScreen(settings);

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
  static Widget buildPremiumScreen(RouteSettings settings) {
    return BlocProvider(
      create: (BuildContext context) => Registrationscreen3Bloc(),
      child: PricingScreen(),
    );
  }

  static Widget buildHomeScreen(RouteSettings settings) {
    return MultiBlocProvider(

        providers: [
          BlocProvider(create: (BuildContext context) =>
          HomescreenblocBloc()..add(FetchProfileEvent())),
          BlocProvider(create: (BuildContext context) => 
              MatchesscreenBloc()..add(FetchSortDataEvent())
          ),
          BlocProvider(create: (BuildContext context) =>
              MailboxBloc()
          ),
        ],
        child: HomeScreen());
  }

  static Widget buildProfileDetailScreen(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>;
    final ProfileModel profile = args['profile'];
    final int index = args['index'];

    return BlocProvider(
      create: (BuildContext context) => ProfileDetailScreenBloc(),
      child: ProfileDetailScreen(
          profile: profile,
        index: index,
      ),
    );
  }
}

