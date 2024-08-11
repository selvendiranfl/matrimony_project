import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  String selectedGender = "";
  DateTime selectedDate = DateTime.now();
  bool showPassword = true;
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
