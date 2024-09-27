
import 'package:drive2goo/Repostory/ModelClass/authentication/SignUpModelClass.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../Repostory/API/Api_main.dart';
import '../../../UI/Toast_message/Toast_message.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  late SignUpModelClass signUpModelClass;
  UserMainapi user=UserMainapi();
  SignUpBloc() : super(SignUpInitial()) {
    on<FetchSignUpEvent>((event, emit) async {
      emit(SignupBlocLoading());
      try{
        signUpModelClass=await user.getsignup(event.name,event.email,event.phone,event.password);
      emit(SignupBlocLoaded());
      }catch(e){
        emit (SignupBlocError());
        ToastMessage().toastmessage(message: e.toString());
      }
      // TODO: implement event handler
    });
  }
}
