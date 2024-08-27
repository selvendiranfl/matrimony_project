import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../fireBaseService.dart';
import '../../../helper/Utilities.dart';

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
        Utilities.showProgress();
        final response = await service.loginWithEmailAndPassword(mailId.text.trim(), password.text.trim());
        Utilities.dismissProgress();
        if(response != null){
         Utilities.UserUiId = response.uid;
         print(Utilities.UserUiId);
         emit(LogInSuccesState());
       }else
       print("failed");
      }


      if(event is FetchUserDataLogInEvent){

        Utilities.showProgress();
        final response = await service.getProfileByUiId(Utilities.UserUiId);
        Utilities.dismissProgress();
        if(response != null){
         Utilities.profileUser = response;
         if(Utilities.profileUser.gender == "Male"){
           Utilities.ProfileCollectionName = "FeMaleprofiles";
           Utilities.SelfCollectionName = "Maleprofiles";
         }else{
           Utilities.ProfileCollectionName = "Maleprofiles";
           Utilities.SelfCollectionName = "FeMaleprofiles";
         }
         print("-----"+Utilities.ProfileCollectionName.toString());
         print("-----"+Utilities.SelfCollectionName.toString());
         print("-----"+Utilities.profileUser.name.toString());
         print("-----"+Utilities.profileUser.gender.toString());
         print("----check---"+Utilities.profileUser.favourites.toString());
         print("------bloc check---${Utilities.profileUser.block}");

          print(Utilities.UserUiId);
          emit(FetchUserProfileSuccessLogInState());
        }else{
          emit(FetchUserProfileFailerLogInState());
          print("-----failed");
        }

      }




    });
  }
}
