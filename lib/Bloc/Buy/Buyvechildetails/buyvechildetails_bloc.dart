import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/Buyvechile/BuyvechildetailsModelClass.dart';
import 'package:drive2goo/UI/Toast_message/Toast_message.dart';
import 'package:meta/meta.dart';

part 'buyvechildetails_event.dart';
part 'buyvechildetails_state.dart';

class BuyvechildetailsBloc extends Bloc<BuyvechildetailsEvent, BuyvechildetailsState> {
  late BuyvechildetailsModelClass buyvechildetailsModelClass;
  UserMainapi userMainapi= UserMainapi();
  BuyvechildetailsBloc() : super(BuyvechildetailsInitial()) {
    on<FetchBuyvechildetails>((event, emit) async {
      emit(BuyvechildetailsBlcoLoading());
      try{
        buyvechildetailsModelClass = await userMainapi.getBuyvechildetails(event.vechilid);
        emit(BuyvechildetailsBlocLoaded());
      }
      catch(error){
        emit(BuyvechildetailsBlocError());
        ToastMessage().toastmessage(message: error.toString());
      }
      // TODO: implement event handler
    });
  }
}
