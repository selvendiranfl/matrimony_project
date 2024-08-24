import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:matrimony_app/helper/Utilities.dart';
import 'package:meta/meta.dart';

import '../../../fireBaseService.dart';

part 'registrationscreen3_event.dart';
part 'registrationscreen3_state.dart';

class Registrationscreen3Bloc extends Bloc<Registrationscreen3Event, Registrationscreen3State> {

  TextEditingController annualIncome = TextEditingController();
  TextEditingController aboutMyself = TextEditingController();
  TextEditingController AncestralValues = TextEditingController();
  String currencyType = "RS";
  String selectedFamilyType = "";
  String Height = "";
  String PhysicalStatus = "";
  String education = "";
  String occupation = "";
  String familyValue = "";
  String result= "";

  FireBaseService firebaseservice = FireBaseService();
  Registrationscreen3Bloc() : super(Registrationscreen3Initial()) {
    on<Registrationscreen3Event>((event, emit) async{
      if(event is RegistrationEvent){
        Utilities.showProgress();
        if(Utilities.profileUser.gender == "Male"){
           result =  await firebaseservice.saveMaleUserProfile(Utilities.profileUser);
        }else{
          result =  await firebaseservice.saveFeMaleUserProfile(Utilities.profileUser);
        }
        Utilities.dismissProgress();
          if(result == "Success"){
            emit(RegistrationsuccessState());
          }else{
            emit(RegistrationFailedState());
          }
            print("User signed up and profile saved successfully!");
      }

      if(event is FetchUserDataEvent){
        Utilities.showProgress();
        final response = await firebaseservice.getProfileByUiId(Utilities.UserUiId);
        Utilities.dismissProgress();
        if(response != null){
          Utilities.profileUser = response;
          print("-----"+Utilities.profileUser.name.toString());
          print("-----"+Utilities.profileUser.gender.toString());
          print("----check---"+Utilities.profileUser.favourites.toString());

          print(Utilities.UserUiId);
          emit(FetchUserProfileSuccessState());
        }else{
          emit(FetchUserProfileFailerState());
          print("-----failed");
        }

      }

    });
  }
}
