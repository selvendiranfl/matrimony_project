import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:matrimony_app/helper/Utilities.dart';
import 'package:meta/meta.dart';

import '../../../fireBaseService.dart';

part 'profile_detail_screen_event.dart';
part 'profile_detail_screen_state.dart';

class ProfileDetailScreenBloc extends Bloc<ProfileDetailScreenEvent, ProfileDetailScreenState> {

  String dataName="";
  String AddingData="";
  TextEditingController AncestralController = TextEditingController();

  FireBaseService firebaseservice = FireBaseService();
  ProfileDetailScreenBloc() : super(ProfileDetailScreenInitial()) {
    on<ProfileDetailScreenEvent>((event, emit) async {

      if(event is DataAddEvent){
        Utilities.showProgress();
        await firebaseservice.saveHabitToFirebase(Utilities.UserUiId, dataName, AddingData);
        Utilities.dismissProgress();
        emit(DataAddedSuccessState());
      }

    });
  }
}
