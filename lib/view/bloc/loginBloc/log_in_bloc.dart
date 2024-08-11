import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

bool showPassword = true;

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInInitial()) {
    on<LogInEvent>((event, emit) {
      if(event is PasswordHideEvent){
        print("ttt");
        showPassword = !showPassword;
        emit(PasswordHiddenState());
      }
      if(event is LoginSummitEvent){
        print("kohhf");
      }
    });
  }
}
