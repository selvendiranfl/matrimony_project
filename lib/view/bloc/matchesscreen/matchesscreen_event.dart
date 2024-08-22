part of 'matchesscreen_bloc.dart';

@immutable
sealed class MatchesscreenEvent {}

class ViewerAddEvent extends MatchesscreenEvent{}

class FavDataEvent extends MatchesscreenEvent{}

class ReqSendEvent extends MatchesscreenEvent{}

class FetchSortDataEvent extends MatchesscreenEvent{}

class UpdateUserDataEvent extends MatchesscreenEvent{}



