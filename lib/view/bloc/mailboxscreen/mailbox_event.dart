part of 'mailbox_bloc.dart';

@immutable
sealed class MailboxEvent {}

class FetchRequestDataEvent extends MailboxEvent {}

class AcceptRequestEvent extends MailboxEvent {}

class DeclineRequestEvent extends MailboxEvent {}