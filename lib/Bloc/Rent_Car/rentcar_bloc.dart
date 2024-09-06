import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/RentCarModel.dart';
import 'package:meta/meta.dart';

import '../../UI/Toast_message/Toast_message.dart';

part 'rentcar_event.dart';
part 'rentcar_state.dart';

class RentcarBloc extends Bloc<RentcarEvent, RentcarState> {
  late RentCarModel rentCarModel;
  User user=User();
  RentcarBloc() : super(RentcarInitial()) {
    on<FetchRentcar>((event, emit) async {
      emit(RentcarBlocLoading());
      try{
        rentCarModel =await user.getrentcar(event.vehicle, event.pickupdate, event.returndate, event.pickuplocation, event.returnlocation, event.amount);
        emit(RentcarBlocLoaded());
      }catch(error){
        emit(RentcarBlocError());
      ToastMessage().toastmessage(message: error.toString());}

      // TODO: implement event handler
    });
  }
}
