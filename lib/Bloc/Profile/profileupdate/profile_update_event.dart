part of 'profile_update_bloc.dart';

@immutable
sealed class ProfileUpdateEvent {}
class FetchProfileUpdatevent extends ProfileUpdateEvent{
  final String fullname;
  final String oldpassword;
  final String newpassword;
  FetchProfileUpdatevent({
    required this.fullname ,
    required this.oldpassword,
    required this.newpassword
});
}