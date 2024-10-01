import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/profileupdate/UserModelclass.dart';
import 'package:drive2goo/UI/Toast_message/Toast_message.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late UserModelclass userModelclass;
  UserMainapi usermainapi=UserMainapi();
  UserBloc() : super(UserInitial()) {
    on<FetchUserevent>((event, emit) async {
      emit(UserBlocLoading());
      try{
        userModelclass=await usermainapi.getUser();
        emit(UserBlocLoaded());

      }catch(error){
        emit(UserBlocError());
        ToastMessage().toastmessage(message: error.toString());
      }
      // TODO: implement event handler
    });
  }
}
