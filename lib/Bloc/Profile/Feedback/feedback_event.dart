part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackEvent {}
class Fetchfeedbackevent extends FeedbackEvent{
  final String comment;
  Fetchfeedbackevent({required this.comment});
}