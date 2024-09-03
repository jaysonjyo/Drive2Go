part of 'nearby_car_bloc.dart';

@immutable
sealed class NearbyCarState {}

final class NearbyCarInitial extends NearbyCarState {}
class NearbyCarBlocLoading extends NearbyCarState{}
class NearbyCarBlocLoaded extends NearbyCarState{}
class NearbyCarBlocError extends NearbyCarState{}