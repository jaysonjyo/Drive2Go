part of 'chat_bloc.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}
class ChatBlocLoading extends ChatState{}
class ChatBlocLoaded extends ChatState{}
class ChatBlocError extends ChatState{}