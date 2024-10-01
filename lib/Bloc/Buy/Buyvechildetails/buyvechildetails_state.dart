part of 'buyvechildetails_bloc.dart';

@immutable
sealed class BuyvechildetailsState {}

final class BuyvechildetailsInitial extends BuyvechildetailsState {}
class BuyvechildetailsBlcoLoading extends BuyvechildetailsState{}
class BuyvechildetailsBlocLoaded extends BuyvechildetailsState{}
class BuyvechildetailsBlocError extends BuyvechildetailsState{}
