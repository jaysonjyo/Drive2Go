part of 'helpcenterpost_bloc.dart';

@immutable
sealed class HelpcenterpostState {}

final class HelpcenterpostInitial extends HelpcenterpostState {}
class HelpcenterpostBlocLoading extends HelpcenterpostState{}
class HelpcenterpostBlocLoaded extends HelpcenterpostState{}
class HelpcenterpostBlocError extends HelpcenterpostState{}