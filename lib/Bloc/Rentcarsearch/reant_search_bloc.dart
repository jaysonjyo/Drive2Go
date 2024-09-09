import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/RentcarsearchModelclass.dart';
import 'package:meta/meta.dart';

import '../../UI/Toast_message/Toast_message.dart';

part 'reant_search_event.dart';
part 'reant_search_state.dart';

class ReantSearchBloc extends Bloc<ReantSearchEvent, ReantSearchState> {
  late List<RentcarsearchModelclass> rentcarsearchModelclass;
  User user =User();
  ReantSearchBloc() : super(ReantSearchInitial()) {
    on<FetchReantSearchEvent>((event, emit) async {
      emit( ReantSearchBlocLoading());
      try {
        rentcarsearchModelclass= await user.getRentsearch(event.brand);
        emit(ReantSearchBlocLoaded());
      }catch(error){
        emit(ReantSearchBlocError());
        ToastMessage().toastmessage(message: error.toString());
      }
      // TODO: implement event handler
    });
  }
}
