part of 'orders4_bloc.dart';

@freezed
class Orders4Event with _$Orders4Event {
  const factory Orders4Event.started() = _Started;
  const factory Orders4Event.getOrdersStat4() = _GetOrders4;

}