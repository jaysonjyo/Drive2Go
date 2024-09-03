import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/NearbyModelClass.dart';
import 'package:meta/meta.dart';

import '../../UI/Toast_message/Toast_message.dart';

part 'nearby_car_event.dart';
part 'nearby_car_state.dart';

class NearbyCarBloc extends Bloc<NearbyCarEvent, NearbyCarState> {
  late List<NearbyCarModelClass>  nearbyCarModelClass;
  User user =User();
  NearbyCarBloc() : super(NearbyCarInitial()) {
    on<FetchNearbycar>((event, emit) async {
      emit(NearbyCarBlocLoading());
      try{
        nearbyCarModelClass= await user.getnearby(event.lat,event.long);
        emit(NearbyCarBlocLoaded());
      }
          catch(e){
        emit(NearbyCarBlocError());
        //toast message was included reson in all error see in ui
        print(e.toString());
        ToastMessage().toastmessage(message: e.toString());

          }
      // TODO: implement event handler
    });
  }
}
