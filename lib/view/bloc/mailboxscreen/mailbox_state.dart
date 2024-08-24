part of 'mailbox_bloc.dart';

@immutable
sealed class MailboxState {}

final class MailboxInitial extends MailboxState {}

final class FetchRequestDatastate extends MailboxState {}

final class RequestAcceptState extends MailboxState {}

final class RequestAcceptFailedState extends MailboxState {}

final class DeclineRequestAcceptState extends MailboxState {}

final class DeclineRequestAcceptFailedState extends MailboxState {}
