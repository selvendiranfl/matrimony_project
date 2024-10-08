import 'package:bloc/bloc.dart';
import 'package:matrimony_app/helper/Utilities.dart';
import 'package:meta/meta.dart';

import '../../../fireBaseService.dart';
import '../../../model/userprofilemodel.dart';

part 'homescreenbloc_event.dart';
part 'homescreenbloc_state.dart';

class HomescreenblocBloc extends Bloc<HomescreenblocEvent, HomescreenblocState> {


  FireBaseService firebaseservice = FireBaseService();

  HomescreenblocBloc() : super(HomescreenblocInitial()) {

    on<HomescreenblocEvent>((event, emit) async {
      if(event is FetchProfileEvent){
        Utilities.showProgress();
        print("-----Event is Called-----");

          try{
            final result = await firebaseservice.getProfiles();
            if(result != null){
              print("----blockme---"+Utilities.profileUser.blockme.toString());
              print("----blockme---"+Utilities.profileUser.block.toString());
              for (var profile in result) {
                if (!Utilities.profileUser.block!.contains(profile.UiId) || !Utilities.profileUser.blockme!.contains(profile.UiId)) {
                  Utilities.AllProfilesList.add(profile);
                }
              }

              for(int i=0;i<Utilities.AllProfilesList.length;i++){
                print("----names---"+Utilities.AllProfilesList[i].name.toString());
                print("----names---"+Utilities.AllProfilesList[i].brothersMarried.toString());
              }
            }
            Utilities.dismissProgress();
          }catch(e){
            print("Error during fetching: $e");
        }

      }
    });
  }
}
