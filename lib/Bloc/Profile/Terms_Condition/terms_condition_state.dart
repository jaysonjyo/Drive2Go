part of 'terms_condition_bloc.dart';

@immutable
sealed class TermsConditionState {}

final class TermsConditionInitial extends TermsConditionState {}
class TermsConditionBlocLoading extends TermsConditionState{}
class TermsConditionBlocLoaded extends TermsConditionState{}
class TermsConditionBlocError extends TermsConditionState{}