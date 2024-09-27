import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:meta/meta.dart';

import '../../../Repostory/ModelClass/authentication/SignInModelClass.dart';
import '../../../UI/Toast_message/Toast_message.dart';


part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  late SignInModelClass signInModelClass;
UserMainapi user=UserMainapi();
  SignInBloc() : super(SignInInitial()) {
    on<FetchSignInEvent>((event, emit) async {
      emit(SignInBlocLoading());
      try{
        signInModelClass=await user.getsignin(event.email,event.password);
      emit(SignInBlocLoaded());
      }
          catch(e){
        emit(SignInBlocError());
        ToastMessage().toastmessage(message: e.toString());
          }
      // TODO: implement event handler
    });
  }
}
