import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/SignINModelClass.dart';
import 'package:meta/meta.dart';
import '../../UI/Toast_message/Toast_message.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  late SignInModelClass signInModelClass;
User user=User();
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
