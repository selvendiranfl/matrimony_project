import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homescreenbloc_event.dart';
part 'homescreenbloc_state.dart';

class HomescreenblocBloc extends Bloc<HomescreenblocEvent, HomescreenblocState> {
  HomescreenblocBloc() : super(HomescreenblocInitial()) {


    on<HomescreenblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
