part of 'allcar_bloc.dart';

@immutable
sealed class AllcarState {}

final class AllcarInitial extends AllcarState {}
class AllcarBlocLoading extends AllcarState{}
class AllcarBlocLoaded extends AllcarState{}
class AllcarBlocError extends AllcarState{}