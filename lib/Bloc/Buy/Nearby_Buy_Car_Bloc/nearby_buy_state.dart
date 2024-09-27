part of 'nearby_buy_bloc.dart';

@immutable
sealed class NearbyBuyState {}

final class NearbyBuyInitial extends NearbyBuyState {}
class NearbybuycarBlocLoading extends NearbyBuyState {}
class NearbybuycarBlocLoaded extends NearbyBuyState {}
class NearbybuycarBlocError extends NearbyBuyState {}
