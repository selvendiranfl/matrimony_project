import 'dart:convert';

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrimony_app/firebase_options.dart';
import 'package:matrimony_app/router.dart';
import 'package:matrimony_app/view/bloc/loginBloc/log_in_bloc.dart';


import 'allImports.dart';
import 'helper/navigatorService.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => LogInBloc(),
        child: LogInPage(),
      ),
      onGenerateRoute: getRoute,
    );
  }
}

