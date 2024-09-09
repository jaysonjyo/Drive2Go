part of 'reant_search_bloc.dart';

@immutable
sealed class ReantSearchState {}

final class ReantSearchInitial extends ReantSearchState {}
class ReantSearchBlocLoading extends ReantSearchState{}
class ReantSearchBlocLoaded extends ReantSearchState{}
class ReantSearchBlocError extends ReantSearchState{}