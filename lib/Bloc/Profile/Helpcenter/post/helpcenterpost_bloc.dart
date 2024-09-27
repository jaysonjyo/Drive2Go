import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/HelpCenter/HelpCenterpostModel.dart';
import 'package:meta/meta.dart';

import '../../../../UI/Toast_message/Toast_message.dart';
part 'helpcenterpost_event.dart';
part 'helpcenterpost_state.dart';

class HelpcenterpostBloc extends Bloc<HelpcenterpostEvent, HelpcenterpostState> {
  late HelpCenterpostModel helpCenterpostModel;
  UserMainapi user= UserMainapi();
  HelpcenterpostBloc() : super(HelpcenterpostInitial()) {
    on<FetchHelpcenterpostevent>((event, emit)async {
      emit(HelpcenterpostBlocLoading());
      try{
        helpCenterpostModel= await user.getHelpcenterpost(event.descriptionmessage);
        emit(HelpcenterpostBlocLoaded());

      }
      catch(e){
        emit(HelpcenterpostBlocError());
        //toast message was included reson in all error see in ui
        print(e.toString());
        ToastMessage().toastmessage(message: e.toString());

      }
      // TODO: implement event handler
    });
  }
}
