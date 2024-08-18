part of 'matchesscreen_bloc.dart';

@immutable
sealed class MatchesscreenEvent {}

class FetchMaleProfileEvent extends MatchesscreenEvent{}

class FetchFeMaleProfileEvent extends MatchesscreenEvent{}
