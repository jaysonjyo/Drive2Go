import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/Buyvechile/Buy_VechilOrderModelClass.dart';
import 'package:drive2goo/UI/Toast_message/Toast_message.dart';
import 'package:meta/meta.dart';

part 'buy_create_order_event.dart';

part 'buy_create_order_state.dart';

class BuyCreateOrderBloc
    extends Bloc<BuyCreateOrderEvent, BuyCreateOrderState> {
  late BuyCreateOrderModelClass buycreateOrderModelClass;
  UserMainapi user = UserMainapi();

  BuyCreateOrderBloc() : super(BuyCreateOrderInitial()) {
    on<FetchBuycreateorderevent>((event, emit) async {
      emit(BuyCreateOrderBlocLoading());
      print("loading");
      try {
        buycreateOrderModelClass = await user.getBuyCreateOrder(
            event.vehicleid,
            event.buyerAddress,
          event.purchaseprice
        );
        emit(BuyCreateOrderBlocLoaded());
        print('loaded');
      } catch (error) {
        ToastMessage().toastmessage(message: error.toString());
        emit(BuyCreateOrderBlocError());
        print("error");
      }
      // TODO: implement event handler
    });
  }
}
