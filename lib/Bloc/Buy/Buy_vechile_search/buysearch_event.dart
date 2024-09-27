part of 'buysearch_bloc.dart';

@immutable
sealed class BuysearchEvent {}
class FetchBuysearchEvent extends BuysearchEvent {
  final String brandsearch;
  FetchBuysearchEvent({ required this.brandsearch});
}