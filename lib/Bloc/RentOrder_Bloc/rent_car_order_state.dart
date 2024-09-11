part of 'rent_car_order_bloc.dart';

@immutable
sealed class RentCarOrderState {}

final class RentCarOrderInitial extends RentCarOrderState {}
class RentCarOrderBlocLoading extends RentCarOrderState{}
class RentCarOrderBlocLoaded extends RentCarOrderState{}
class RentCarOrderBlocError extends RentCarOrderState{}
