part of 'helpcenterpost_bloc.dart';

@immutable
sealed class HelpcenterpostEvent {}
class FetchHelpcenterpostevent extends HelpcenterpostEvent{
  final String descriptionmessage;
  FetchHelpcenterpostevent({
    required this.descriptionmessage
});
}