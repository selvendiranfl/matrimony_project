part of 'log_in_bloc.dart';

@immutable
sealed class LogInEvent {}

class PasswordHideEvent extends LogInEvent {}

class LoginSummitEvent extends LogInEvent {}

class FetchUserDataEvent extends LogInEvent {}

