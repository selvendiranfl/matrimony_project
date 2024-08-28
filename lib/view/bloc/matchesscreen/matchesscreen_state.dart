part of 'matchesscreen_bloc.dart';

@immutable
sealed class MatchesscreenState {}

final class MatchesscreenInitial extends MatchesscreenState {}

final class FetchProfileState extends MatchesscreenState {}

final class ViewerAddStateSuccessState extends MatchesscreenState {}

final class SortListuserGettingState extends MatchesscreenState {}

final class ShortListAdded extends MatchesscreenState {}

final class UpdateUserDataState extends MatchesscreenState {}

final class UpdateUserDataFailedState extends MatchesscreenState {}

final class ReportedSuccessState extends MatchesscreenState {}

final class ReportedFailedState extends MatchesscreenState {}

final class BlockedUserSuccessState extends MatchesscreenState {}

final class BlockedUserFailedState extends MatchesscreenState {}

final class SortListuserUpdatedState extends MatchesscreenState {}
