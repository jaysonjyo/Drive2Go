part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {
}
class FetchSignInEvent extends SignInEvent{
final String email;
final String password;
FetchSignInEvent({required this.email ,required this.password});
}

