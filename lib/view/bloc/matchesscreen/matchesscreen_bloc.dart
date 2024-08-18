import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'matchesscreen_event.dart';
part 'matchesscreen_state.dart';

class MatchesscreenBloc extends Bloc<MatchesscreenEvent, MatchesscreenState> {
  MatchesscreenBloc() : super(MatchesscreenInitial()) {
    on<MatchesscreenEvent>((event, emit) {

    });
  }
}
