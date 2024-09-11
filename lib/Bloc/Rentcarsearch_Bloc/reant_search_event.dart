part of 'reant_search_bloc.dart';

@immutable
sealed class ReantSearchEvent {}
class FetchReantSearchEvent extends ReantSearchEvent {
  final String brand;
  FetchReantSearchEvent({ required this.brand});
}