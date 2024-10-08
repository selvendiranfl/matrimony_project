part of 'log_in_bloc.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}

 class PasswordHiddenState extends LogInState {}

class LogInSuccesState extends LogInState {}

class FetchUserProfileSuccessLogInState extends LogInState {}

class FetchUserProfileFailerLogInState extends LogInState {}

