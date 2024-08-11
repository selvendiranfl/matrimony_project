import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrimony_app/view/bloc/SignUpBloc/sign_up_bloc.dart';
import 'package:matrimony_app/view/bloc/loginBloc/log_in_bloc.dart';
import 'package:matrimony_app/view/screens/signupScreen.dart';

import 'allImports.dart';


void main() {
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
        create: (context) => SignUpBloc(),
        child: SignUpScreen(),
      ),
    );
  }
}

