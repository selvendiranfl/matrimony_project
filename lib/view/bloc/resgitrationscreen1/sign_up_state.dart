part of 'registration_screen1_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class PasswordHiddenSUState extends SignUpState {}

final class SignUpSuccessState extends SignUpState {}

final class SignUpfailedState extends SignUpState {}
