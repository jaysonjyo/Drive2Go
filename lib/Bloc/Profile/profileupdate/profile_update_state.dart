part of 'profile_update_bloc.dart';

@immutable
sealed class ProfileUpdateState {}

final class ProfileUpdateInitial extends ProfileUpdateState {}
class ProfileUpdateBlocLoading extends ProfileUpdateState{}
class ProfileUpdateBlocLoaded extends ProfileUpdateState{}
class ProfileUpdateBlocError extends ProfileUpdateState{}