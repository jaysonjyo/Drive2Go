import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/Buyvechile/AllBuyVechileModelclass.dart';
import 'package:drive2goo/UI/Toast_message/Toast_message.dart';
import 'package:meta/meta.dart';

part 'all_buycar_event.dart';
part 'all_buycar_state.dart';

class AllBuycarBloc extends Bloc<AllBuycarEvent, AllBuycarState> {
  late List<AllBuyVechileModelclass> allBuyVechileModelclass;
  User user=User();
  AllBuycarBloc() : super(AllBuycarInitial()) {
    on<FetchAllBuycarEvent>((event, emit) async {
emit(AllBuycarBlocLoading());
try{
  allBuyVechileModelclass=await user.getAllBuycar();
  emit(AllBuycarBlocLoaded());
}catch(error){

  emit(AllBuycarBlocError());
ToastMessage().toastmessage(message: error.toString());
}
      // TODO: implement event handler
    });
  }
}
