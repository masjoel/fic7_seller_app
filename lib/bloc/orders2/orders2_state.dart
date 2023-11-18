part of 'orders2_bloc.dart';

@freezed
class Orders2State with _$Orders2State {
  const factory Orders2State.initial() = _Initial;
  const factory Orders2State.loading() = _Loading;
  const factory Orders2State.loaded(OrderResponseModel data) = _Loaded;
  const factory Orders2State.error(String message) = _Error;
}
