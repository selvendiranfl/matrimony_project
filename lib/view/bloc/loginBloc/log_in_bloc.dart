import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../fireBaseService.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';


class LogInBloc extends Bloc<LogInEvent, LogInState> {


  bool showPassword = true;
  TextEditingController mailId = TextEditingController();
  TextEditingController password = TextEditingController();
  FireBaseService service = FireBaseService();

  LogInBloc() : super(LogInInitial()) {
    on<LogInEvent>((event, emit) async {
      if(event is PasswordHideEvent){
        print("ttt");
        showPassword = !showPassword;
        emit(PasswordHiddenState());
      }
      if(event is LoginSummitEvent){

        final response = await service.loginWithEmailAndPassword(mailId.text.trim(), password.text.trim());
       if(response != null){
         emit(LogInSuccesState());
       }else
       print("failed");
      }
    });
  }
}
