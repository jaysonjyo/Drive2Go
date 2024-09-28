import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/Terms_Condition/TermsConditionModelClass.dart';
import 'package:drive2goo/UI/Toast_message/Toast_message.dart';
import 'package:meta/meta.dart';

part 'terms_condition_event.dart';
part 'terms_condition_state.dart';

class TermsConditionBloc extends Bloc<TermsConditionEvent, TermsConditionState> {
  late TermsConditionModelClass termsConditionModelClass;
  UserMainapi usermainapi =UserMainapi();
  TermsConditionBloc() : super(TermsConditionInitial()) {
    on<FetchTermsConditionevent>((event, emit) async {
      emit(TermsConditionBlocLoading());
      try{
        termsConditionModelClass =await usermainapi.getTermscnonditio();
        emit(TermsConditionBlocLoaded());
      }catch(error){
        emit(TermsConditionBlocError());
      ToastMessage().toastmessage(message: error.toString());
      }
      // TODO: implement event handler
    });
  }
}
