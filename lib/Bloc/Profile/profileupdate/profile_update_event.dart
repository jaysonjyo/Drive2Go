part of 'profile_update_bloc.dart';

@immutable
sealed class ProfileUpdateEvent {}
class FetchProfileUpdatevent extends ProfileUpdateEvent{
  final String? fullname;
  final String? oldpassword;
  final String? newpassword;
  final File? userimae;
  final bool boolcheckingimage;
  FetchProfileUpdatevent(  {
     this.fullname ,
     this.oldpassword,
     this.newpassword,
    required this.boolcheckingimage,
    this.userimae,
});
}