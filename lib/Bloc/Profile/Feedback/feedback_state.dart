part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackState {}

final class FeedbackInitial extends FeedbackState {}
class FeedbackBlocLoading extends FeedbackState{}
class FeedbackBlocLoaded extends FeedbackState{}
class FeedbackBlocError extends FeedbackState{}