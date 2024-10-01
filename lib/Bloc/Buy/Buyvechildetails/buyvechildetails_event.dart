part of 'buyvechildetails_bloc.dart';

@immutable
sealed class BuyvechildetailsEvent {}
class FetchBuyvechildetails  extends BuyvechildetailsEvent{
  final String vechilid;
  FetchBuyvechildetails({
    required this.vechilid
});
}
