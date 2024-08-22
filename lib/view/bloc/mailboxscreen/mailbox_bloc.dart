import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mailbox_event.dart';
part 'mailbox_state.dart';

class MailboxBloc extends Bloc<MailboxEvent, MailboxState> {
  MailboxBloc() : super(MailboxInitial()) {
    on<MailboxEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
