import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  String selectedGender = "";
  String selectedMarrydiffComm = "";
  DateTime selectedDate = DateTime.now();
  bool showPassword = true;
  String selectedValue ="select";
  String selectedReligion="select";
  String selectedLanguage="select";
  String selectedMarStatus="select";
  SignUpBloc() : super(SignUpInitial()) {

    on<SignUpEvent>((event, emit) {
      if(event is PasswordHideSUEvent){
        print("ttt");
        showPassword = !showPassword;
        emit(PasswordHiddenSUState());
      }
    });
  }
}
