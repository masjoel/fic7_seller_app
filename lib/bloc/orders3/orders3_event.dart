part of 'orders3_bloc.dart';

@freezed
class Orders3Event with _$Orders3Event {
  const factory Orders3Event.started() = _Started;
  const factory Orders3Event.getOrdersStat3() = _GetOrders3;

}