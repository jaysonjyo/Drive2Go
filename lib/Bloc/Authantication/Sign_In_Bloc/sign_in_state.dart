part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}
class SignInBlocLoading extends SignInState{}
class SignInBlocLoaded extends SignInState{}
class SignInBlocError extends SignInState{}