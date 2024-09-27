part of 'rentcar_bloc.dart';

@immutable
sealed class RentcarEvent {}
class FetchRentcar extends RentcarEvent {
  final String vehicle;
  final String pickupdate;
  final String returndate;
  final String pickuplocation;
  final String returnlocation;
  final String amount;
  FetchRentcar({required this.vehicle,required this.pickupdate ,required this.returndate,required this.pickuplocation ,required this.returnlocation,required this.amount });
}