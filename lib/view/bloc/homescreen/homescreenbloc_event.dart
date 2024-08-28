part of 'homescreenbloc_bloc.dart';

@immutable
sealed class HomescreenblocEvent {}

class FetchProfileEvent extends HomescreenblocEvent{}

class FetchMaleProfileEvent extends HomescreenblocEvent{}

class FetchFeMaleProfileEvent extends HomescreenblocEvent{}

class AddProfilePhotoImageEvent extends HomescreenblocEvent{}