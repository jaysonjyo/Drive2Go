part of 'buy_create_order_bloc.dart';

@immutable
sealed class BuyCreateOrderState {}

final class BuyCreateOrderInitial extends BuyCreateOrderState {}
class BuyCreateOrderBlocLoading extends BuyCreateOrderState {}
class BuyCreateOrderBlocLoaded extends BuyCreateOrderState {}
class BuyCreateOrderBlocError extends BuyCreateOrderState {}
