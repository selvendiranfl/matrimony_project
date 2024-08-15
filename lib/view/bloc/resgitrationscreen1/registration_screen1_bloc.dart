import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../fireBaseService.dart';
import '../../../helper/Utilities.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  TextEditingController userName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController passWord = TextEditingController();
  String selectedGender = "";
  String countryCode = "";
  String selectedMarrydiffComm = "";
  DateTime selectedDate = DateTime.now();
  bool showPassword = true;
  String selectedCreatedFor ="select";
  String selectedReligion="select";
  String selectedLanguage="select";

  FireBaseService firebaseservice = FireBaseService();

  SignUpBloc() : super(SignUpInitial()) {

    on<SignUpEvent>((event, emit) async {
      if(event is PasswordHideSUEvent){
        print("ttt");
        showPassword = !showPassword;
        emit(PasswordHiddenSUState());
      }
      if (event is SignUpwithidandPassEvent) {
        print("Starting sign-up process...");

        String? email = Utilities.profileUser.mailId;
        String? password = Utilities.profileUser.password;
        print(Utilities.profileUser.mailId);
        print(Utilities.profileUser.password);
        if (email != null && password != null) {
          try {
            User? userCredential = await firebaseservice.signUpWithEmailAndPassword(email, password);
            if (userCredential != null && userCredential.uid.isNotEmpty) {
              print("Sign-up success: ${userCredential.uid}");
              // Continue with profile saving or navigation
            } else {
              print("Failed to sign up: UserCredential is null or UID is empty.");
            }
          } catch (e) {
            print("Error during sign-up: $e");

          }
        } else {
          print("Email or Password is null.");
        }
        emit(SignUpSuccessState());
      }

    });
  }
}
