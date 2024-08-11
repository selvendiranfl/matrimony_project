part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class PasswordHideSUEvent extends SignUpEvent {}
