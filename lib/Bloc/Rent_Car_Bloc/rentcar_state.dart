part of 'rentcar_bloc.dart';

@immutable
sealed class RentcarState {}

final class RentcarInitial extends RentcarState {}
class RentcarBlocLoading extends RentcarState{}
class RentcarBlocLoaded extends RentcarState{}
class RentcarBlocError extends RentcarState{}