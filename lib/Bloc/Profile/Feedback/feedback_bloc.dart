import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/FeedBack/FeedBackModel.dart';
import 'package:drive2goo/UI/Toast_message/Toast_message.dart';
import 'package:meta/meta.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  late FeedBackModel feedBackModel;
  UserMainapi usermainapi =UserMainapi();
  FeedbackBloc() : super(FeedbackInitial()) {
    on<Fetchfeedbackevent>((event, emit) async {
      emit(FeedbackBlocLoading());
      try {
        feedBackModel= await usermainapi.getFeedback(event.comment);
        emit(FeedbackBlocLoaded());
      }catch(error){
        emit(FeedbackBlocError());
        ToastMessage().toastmessage(message: error.toString());
      }
      // TODO: implement event handler
    });
  }
}
