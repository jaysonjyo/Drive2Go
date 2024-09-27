import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/HelpCenter/HelpcenterChatModel.dart';
import 'package:drive2goo/UI/Toast_message/Toast_message.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  late List<HelpcenterChatModel> helpcenterChatModel;
  UserMainapi usermainapi = UserMainapi();
  ChatBloc() : super(ChatInitial()) {
    on<Fetchchatevent>((event, emit) async {
      emit(ChatBlocLoading());
      try{
        helpcenterChatModel =await usermainapi.getchat();
        emit(ChatBlocLoaded());

      }catch(error){
        emit(ChatBlocError());
        ToastMessage().toastmessage(message: error.toString());

      }

      // TODO: implement event handler
    });
  }
}
