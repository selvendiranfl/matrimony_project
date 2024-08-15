part of 'registration_screen1_bloc.dart';

@immutable
sealed class SignUpEvent {}

class PasswordHideSUEvent extends SignUpEvent {}

class SignUpwithidandPassEvent extends SignUpEvent {}
