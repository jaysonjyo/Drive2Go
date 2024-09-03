part of 'nearby_car_bloc.dart';

@immutable
sealed class NearbyCarEvent {}
class FetchNearbycar extends NearbyCarEvent{
final String lat;
final String long;
FetchNearbycar({required this.lat,required this.long});
}