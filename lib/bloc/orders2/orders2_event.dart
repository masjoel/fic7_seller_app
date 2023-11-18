part of 'orders2_bloc.dart';

@freezed
class Orders2Event with _$Orders2Event {
  const factory Orders2Event.started() = _Started;
  const factory Orders2Event.getOrdersStat2() = _GetOrders2;

}