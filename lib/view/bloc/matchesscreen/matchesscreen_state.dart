part of 'matchesscreen_bloc.dart';

@immutable
sealed class MatchesscreenState {}

final class MatchesscreenInitial extends MatchesscreenState {}

final class FetchProfileState extends MatchesscreenState {}
