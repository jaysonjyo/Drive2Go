import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/Buyvechile/BuyvehileSearchModelclass.dart';
import 'package:drive2goo/UI/Toast_message/Toast_message.dart';
import 'package:meta/meta.dart';

part 'buysearch_event.dart';
part 'buysearch_state.dart';

class BuysearchBloc extends Bloc<BuysearchEvent, BuysearchState> {
  late List<BuyvehileSearchModelclass> buyvehileSearchModelclass;
  UserMainapi user =UserMainapi();
  BuysearchBloc() : super(BuysearchInitial()) {
    on<FetchBuysearchEvent>((event, emit) async {
      emit(BuysearchBlocLoading());
      try{
        buyvehileSearchModelclass =await user.getBuyvehileSearch(event.brandsearch);
        emit(BuysearchBlocLoaded());
      }catch(error){
        emit(BuysearchBlocError());
        ToastMessage().toastmessage(message: error.toString());
      }
      // TODO: implement event handler
    });
  }
}
