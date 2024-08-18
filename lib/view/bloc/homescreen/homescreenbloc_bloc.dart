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
        print("-----Event is Called---");
        if(Utilities.profileUser.gender == "Male"){
          try{
            final result = await firebaseservice.getFeMaleProfiles();
            if(result != null){

              Utilities.AllProfilesList.addAll(result);

              for(int i=0;i<Utilities.AllProfilesList.length;i++){
                print("----names---"+Utilities.AllProfilesList[0].name.toString());
              }
            }

          }catch(e){
            print("Error during fetching: $e");
          }
        }else{
          try{
            final result = await firebaseservice.getMaleProfiles();
            if(result != null){

              Utilities.AllProfilesList.addAll(result);

              for(int i=0;i<Utilities.AllProfilesList.length;i++){
                print("----names---"+Utilities.AllProfilesList[0].name.toString());
              }
            }

          }catch(e){
            print("Error during fetching: $e");
          }
        }

      }
    });
  }
}
