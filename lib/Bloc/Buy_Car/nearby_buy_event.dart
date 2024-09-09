part of 'nearby_buy_bloc.dart';

@immutable
sealed class NearbyBuyEvent {}
class FetchNearbyBuycarevent extends NearbyBuyEvent{
  final String lat;
  final String long;
  FetchNearbyBuycarevent({required this.lat,required this.long});
}
