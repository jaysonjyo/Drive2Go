part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}
class UserBlocLoading extends UserState{}
class UserBlocLoaded extends UserState{}
class UserBlocError extends UserState{}