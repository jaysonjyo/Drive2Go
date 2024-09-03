part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}
class FetchSignUpEvent extends SignUpEvent{
 final String name;
 final String email;
 final String phone;
 final String password;
 FetchSignUpEvent({required this.name,required this.email,required this.phone,required this.password});

}
