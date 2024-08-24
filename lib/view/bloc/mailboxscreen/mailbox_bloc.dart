import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../fireBaseService.dart';
import '../../../helper/Utilities.dart';
import '../../../model/userprofilemodel.dart';

part 'mailbox_event.dart';
part 'mailbox_state.dart';

class MailboxBloc extends Bloc<MailboxEvent, MailboxState> {

  FireBaseService firebaseservice = FireBaseService();
  int AcceptProfileIndex = 0;
  List<ProfileModel> RequestProfileList = [];

  MailboxBloc() : super(MailboxInitial()) {
    on<MailboxEvent>((event, emit) async {
      if(event is FetchRequestDataEvent) {
        RequestProfileList.clear();
        Utilities.showProgress();
        print("---Viewed you-----");
        for (int i = 0; i < Utilities.profileUser.requests!.length; i++) {
          print("---Requested you-----${Utilities.profileUser.requests![i]}");
          final response = await firebaseservice.getProfileByUiId(
              Utilities.profileUser.requests![i]);
          RequestProfileList.add(response!);
        }
        Utilities.dismissProgress();
        emit(FetchRequestDatastate());
      }

      if(event is AcceptRequestEvent){
        Utilities.showProgress();

        final response = await firebaseservice.AcceptInterestedReq(Utilities.UserUiId, RequestProfileList[AcceptProfileIndex].UiId!);
        Utilities.dismissProgress();
        if(response != null){
          Utilities.profileUser = response;

          emit(RequestAcceptState());
        }else{
          emit(RequestAcceptFailedState());
        }

      }
      if(event is DeclineRequestEvent){

        Utilities.showProgress();
        final response = await firebaseservice.DeclineInterestedReq(Utilities.UserUiId, RequestProfileList[AcceptProfileIndex].UiId!);
        Utilities.dismissProgress();
        if(response != null){
          Utilities.profileUser = response;

          emit(DeclineRequestAcceptState());
        }else{
          emit(DeclineRequestAcceptFailedState());
        }

      }







    });
  }
}
