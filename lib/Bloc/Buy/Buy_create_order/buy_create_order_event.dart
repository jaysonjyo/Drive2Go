part of 'buy_create_order_bloc.dart';

@immutable
sealed class BuyCreateOrderEvent {}

class FetchBuycreateorderevent extends BuyCreateOrderEvent {
  final String vehicleid;
  final String buyerAddress;
final String purchaseprice;

  FetchBuycreateorderevent({
    required this.vehicleid,
    required this.buyerAddress,
    required this.purchaseprice,
  });
}
