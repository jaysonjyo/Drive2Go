import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/NearByBuyCarModelClass.dart';
import 'package:meta/meta.dart';

import '../../UI/Toast_message/Toast_message.dart';

part 'nearby_buy_event.dart';
part 'nearby_buy_state.dart';

class NearbyBuyBloc extends Bloc<NearbyBuyEvent, NearbyBuyState> {
  late List<NearByBuyCarModelClass> nearByBuyCarModelClass;
  User user =User();
  NearbyBuyBloc() : super(NearbyBuyInitial()) {
    on<FetchNearbyBuycarevent>((event, emit) async{
      emit(NearbybuycarBlocLoading());
      try {
        nearByBuyCarModelClass =await user.getNBuycar(event.lat, event.long);
        emit(NearbybuycarBlocLoaded());
      }catch(error){

        emit(NearbybuycarBlocError());
        ToastMessage().toastmessage(message: error.toString());
      }
      // TODO: implement event handler
    });
  }
}
