import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrimony_app/router.dart';
import 'package:matrimony_app/view/bloc/SignUpBloc/sign_up_bloc.dart';
import 'package:matrimony_app/view/bloc/loginBloc/log_in_bloc.dart';
import 'package:matrimony_app/view/screens/signupScreen.dart';

import 'allImports.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => LogInBloc(),
        child: LogInPage(),
      ),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  Route<dynamic>? route;

  route = getRoute(settings);
    return route;

}
