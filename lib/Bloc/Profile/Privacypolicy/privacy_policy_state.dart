part of 'privacy_policy_bloc.dart';

@immutable
sealed class PrivacyPolicyState {}

final class PrivacyPolicyInitial extends PrivacyPolicyState {}
class PrivacyPolicyBlocLoading extends PrivacyPolicyState{}
class PrivacyPolicyBlocLoaded extends PrivacyPolicyState{}
class PrivacyPolicyBlocError extends PrivacyPolicyState{}