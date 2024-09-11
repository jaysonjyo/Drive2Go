import 'package:bloc/bloc.dart';
import 'package:drive2goo/Repostory/API/Api_main.dart';
import 'package:drive2goo/Repostory/ModelClass/Buyvechile/AllBuyVechileModelclass.dart';
import 'package:meta/meta.dart';

part 'all_buycar_event.dart';
part 'all_buycar_state.dart';

class AllBuycarBloc extends Bloc<AllBuycarEvent, AllBuycarState> {
  late AllBuyVechileModelclass allBuyVechileModelclass;
  User user=User();
  AllBuycarBloc() : super(AllBuycarInitial()) {
    on<AllBuycarEvent>((event, emit) {

      // TODO: implement event handler
    });
  }
}
