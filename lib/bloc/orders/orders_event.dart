part of 'orders_bloc.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const factory OrdersEvent.started() = _Started;
  const factory OrdersEvent.getOrders() = _GetOrders;
  const factory OrdersEvent.getOrdersStat1() = _GetOrders1;
}
