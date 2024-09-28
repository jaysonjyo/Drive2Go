import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/Privacy_policy/PrivacyPolicyModelClass.dart';
import 'package:drive2goo/UI/Toast_message/Toast_message.dart';
import 'package:meta/meta.dart';

part 'privacy_policy_event.dart';
part 'privacy_policy_state.dart';

class PrivacyPolicyBloc extends Bloc<PrivacyPolicyEvent, PrivacyPolicyState> {
  late PrivacyPolicyModelClass privacyPolicyModelClass;
  UserMainapi usermainapi = UserMainapi();
  PrivacyPolicyBloc() : super(PrivacyPolicyInitial()) {
    on<FetchPrivacyPolicy>((event, emit) async {
      emit(PrivacyPolicyBlocLoading());
      try {
        privacyPolicyModelClass=await usermainapi.getPrivacypolicy();
        emit(PrivacyPolicyBlocLoaded());

      }catch(error){
        emit(PrivacyPolicyBlocError());
        ToastMessage().toastmessage(message: error.toString());
      }
      // TODO: implement event handler
    });
  }
}
