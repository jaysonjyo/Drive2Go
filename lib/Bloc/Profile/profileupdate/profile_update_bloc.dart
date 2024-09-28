import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/profileupdate/ProfileUpdateModelClass.dart';
import 'package:drive2goo/UI/Toast_message/Toast_message.dart';
import 'package:meta/meta.dart';

part 'profile_update_event.dart';
part 'profile_update_state.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  late ProfileUpdateModelClass profileUpdateModelClass;
  UserMainapi usermainapi= UserMainapi();
  ProfileUpdateBloc() : super(ProfileUpdateInitial()) {
    on<FetchProfileUpdatevent>((event, emit) async{
      emit(ProfileUpdateBlocLoading());
      try{
        profileUpdateModelClass=await usermainapi.getProfileupdate(event.fullname, event.oldpassword, event.newpassword);
        emit(ProfileUpdateBlocLoaded());
      }catch(error){
        emit(ProfileUpdateBlocError());
        ToastMessage().toastmessage(message: error.toString());

      }
      // TODO: implement event handler
    });
  }
}
