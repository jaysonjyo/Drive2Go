part of 'all_buycar_bloc.dart';

@immutable
sealed class AllBuycarState {}

final class AllBuycarInitial extends AllBuycarState {}
class AllBuycarBlocLoading extends AllBuycarState{}
class AllBuycarBlocLoaded extends AllBuycarState{}
class AllBuycarBlocError extends AllBuycarState{}