import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:matrimony_app/helper/Utilities.dart';
import 'package:meta/meta.dart';

import '../../../fireBaseService.dart';
import '../../../model/userprofilemodel.dart';

part 'matchesscreen_event.dart';
part 'matchesscreen_state.dart';

class MatchesscreenBloc extends Bloc<MatchesscreenEvent, MatchesscreenState> {

  TextEditingController reportController = new TextEditingController();
  String ReportUserID = "";
  String BlockingUserID = "";
  FireBaseService firebaseservice = FireBaseService();
  String SelectedProfileId="";
  String SelectedfavId="";
  int SelectedProfileIndex= 0;
  String SortBy ="Viewed you";
  String SelectedRecieverId = "";
  List<ProfileModel> SortingUserList = [];
  MatchesscreenBloc() : super(MatchesscreenInitial()) {
    on<MatchesscreenEvent>((event, emit) async {

      if(event is ViewerAddEvent){
        Utilities.showProgress();
        final result = await firebaseservice.saveViewerData(SelectedProfileId, Utilities.UserUiId);
        Utilities.dismissProgress();
        if(result == "Success"){
          emit(ViewerAddStateSuccessState());
        }
      }

      if(event is FavDataEvent){
        Utilities.showProgress();
        final result;
        if(Utilities.profileUser.favourites!.contains(SelectedfavId)){
          print("removing");
          result = await firebaseservice.removefavData(Utilities.UserUiId, SelectedfavId);

        }else{
          result = await firebaseservice.savefavData(Utilities.UserUiId, SelectedfavId );
          print("adding");
        }
        Utilities.dismissProgress();
        if(result != null){
          Utilities.profileUser = result!;
          print("----Fav---${Utilities.profileUser.favourites}");
          emit(ShortListAdded());
        }
      }
      if(event is ReqSendEvent){
        Utilities.showProgress();
        final result;
        if(Utilities.profileUser.requestsent!.contains(SelectedRecieverId)){
          print("----Unsend Req--------");
          result = await firebaseservice.unSendInterestedReq(Utilities.UserUiId, SelectedRecieverId);

        }else{
          result = await firebaseservice.sendInterestedReq(Utilities.UserUiId, SelectedRecieverId );
          print("--------Send Req-------");
        }
        Utilities.dismissProgress();
        if(result != null){
          Utilities.profileUser = result!;
          print("----Fav---${Utilities.profileUser.requestsent}");
          emit(ShortListAdded());
        }
      }
      if(event is FetchSortDataEvent){
        print("---FetchSortDataEvent-----");
        SortingUserList.clear();
        Utilities.showProgress();
        if(SortBy == "Viewed you"){
          print("---Viewed you-----");
          for(int i=0;i<Utilities.profileUser.viewers!.length;i++){
            print("---Viewed you-----${Utilities.profileUser.viewers![i]}");
            final response = await firebaseservice.getProfileByUiId(Utilities.profileUser.viewers![i]);
            if(response != null){
              SortingUserList.add(response!);
            }
            //print(SortingUserList[i].name);
          }
        }else if(SortBy == "Shortlisted by you"){
          print("---Shortlisted by you-----");
          for(int i=0;i<Utilities.profileUser.favourites!.length;i++){
            final response = await firebaseservice.getProfileByUiId(Utilities.profileUser.favourites![i]);
            if(response != null){
              SortingUserList.add(response!);
            }
            print(SortingUserList[i].name);
          }
        }
        Utilities.dismissProgress();
        emit(SortListuserGettingState());
      }



      if(event is ReportUserEvent){
        Utilities.showProgress();
        final result = await firebaseservice.submitReport(Utilities.UserUiId, ReportUserID, reportController.text.trim());
        Utilities.dismissProgress();
        if(result == "Success"){
          Utilities.showToast("Report Saved");
        }else{
          Utilities.showToast("Report failed");
        }
      }
      if(event is BlockUserEvent){

        Utilities.showProgress();
        final result = await firebaseservice.addBlockUser(Utilities.UserUiId, BlockingUserID);
        Utilities.dismissProgress();

        if(result != null){
          print("------block check---${result!.block}");
          Utilities.profileUser = result!;
          print("------bloc check---${Utilities.profileUser.block}");
          Utilities.showToast("Blocked");
        }else{
          Utilities.showToast("Blocking failed");
        }

      }




    });
  }
}
