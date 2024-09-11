import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/Rentvechile/RentOrderMOdelClass.dart';
import 'package:drive2goo/UI/Toast_message/Toast_message.dart';
import 'package:meta/meta.dart';

part 'rent_car_order_event.dart';
part 'rent_car_order_state.dart';

class RentCarOrderBloc extends Bloc<RentCarOrderEvent, RentCarOrderState> {
  late List<RentCarOrderModelClass> rentCarOrderModelClass;
  User user =User();
  RentCarOrderBloc() : super(RentCarOrderInitial()) {
    on<FetchRentcarOrderEvent>((event, emit) async {
      emit( RentCarOrderBlocLoading());
      try {
        rentCarOrderModelClass= await user.getRentorder();
        emit(RentCarOrderBlocLoaded());
      }catch(error){
        emit(RentCarOrderBlocError());
        ToastMessage().toastmessage(message: error.toString());
      }
      // TODO: implement event handler
    });
  }
}
