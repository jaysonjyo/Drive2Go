part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {
}
class SignupBlocLoading extends SignUpState{}
class SignupBlocLoaded extends SignUpState{}
class SignupBlocError extends SignUpState{}