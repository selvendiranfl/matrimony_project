part of 'registrationscreen3_bloc.dart';

@immutable
sealed class Registrationscreen3State {}

final class Registrationscreen3Initial extends Registrationscreen3State {}

final class RegistrationsuccessState extends Registrationscreen3State {}

final class RegistrationFailedState extends Registrationscreen3State {}

class FetchUserProfileSuccessState extends Registrationscreen3State {}

class FetchUserProfileFailerState extends Registrationscreen3State {}
