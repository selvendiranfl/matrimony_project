import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_detail_screen_event.dart';
part 'profile_detail_screen_state.dart';

class ProfileDetailScreenBloc extends Bloc<ProfileDetailScreenEvent, ProfileDetailScreenState> {
  ProfileDetailScreenBloc() : super(ProfileDetailScreenInitial()) {
    on<ProfileDetailScreenEvent>((event, emit) {



    });
  }
}
