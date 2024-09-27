import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/Buyvechile/Buy_OrderShow_Modelclass.dart';
import 'package:meta/meta.dart';

import '../../../UI/Toast_message/Toast_message.dart';



part 'buyorder_event.dart';
part 'buyorder_state.dart';

class BuyorderBloc extends Bloc<BuyorderEvent, BuyorderState> {
  late List<BuyOrderShowModelclass> buyOrderShowModelclass;
  UserMainapi user=UserMainapi();
  BuyorderBloc() : super(BuyorderInitial()) {
    on<FetchBuyorderEvent>((event, emit) async {
      emit(BuyorderBlocLoading());
      try{
        buyOrderShowModelclass = await user.getBuyorder();
        emit(BuyorderBlocLoaded());
      }catch(error){

        emit(BuyorderBlocError());
        ToastMessage().toastmessage(message: error.toString());
      }
      // TODO: implement event handler
    });
  }
}
