part of 'buyorder_bloc.dart';

@immutable
sealed class BuyorderState {}

final class BuyorderInitial extends BuyorderState {}
class BuyorderBlocLoading extends BuyorderState{}
class BuyorderBlocLoaded extends BuyorderState{}
class BuyorderBlocError extends BuyorderState{}