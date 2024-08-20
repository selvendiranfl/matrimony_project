part of 'profile_detail_screen_bloc.dart';

@immutable
sealed class ProfileDetailScreenState {}

final class ProfileDetailScreenInitial extends ProfileDetailScreenState {}

final class DataAddedSuccessState extends ProfileDetailScreenState {}
