part of 'buysearch_bloc.dart';

@immutable
sealed class BuysearchState {}

final class BuysearchInitial extends BuysearchState {}
class BuysearchBlocLoading extends BuysearchState{}
class BuysearchBlocLoaded extends BuysearchState{}
class BuysearchBlocError extends BuysearchState{}