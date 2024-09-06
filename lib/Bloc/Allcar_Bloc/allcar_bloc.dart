import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/AllcarModel.dart';
import 'package:meta/meta.dart';

import '../../UI/Toast_message/Toast_message.dart';

part 'allcar_event.dart';
part 'allcar_state.dart';

class AllcarBloc extends Bloc<AllcarEvent, AllcarState> {
  late List<AllcarModelClass> allcarModelClass;
  User user= User();
  AllcarBloc() : super(AllcarInitial()) {
    on<FetchAllcarEvent>((event, emit) async {
      emit(AllcarBlocLoading());
      try{
        allcarModelClass=await user.getAllcar();
        emit(AllcarBlocLoaded());
      }
      catch (error){
        emit(AllcarBlocError());
        ToastMessage().toastmessage(message: error.toString());
      }
      // TODO: implement event handler
    });
  }
}
