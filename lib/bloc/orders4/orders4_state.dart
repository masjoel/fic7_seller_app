part of 'orders4_bloc.dart';

@freezed
class Orders4State with _$Orders4State {
  const factory Orders4State.initial() = _Initial;
  const factory Orders4State.loading() = _Loading;
  const factory Orders4State.loaded(OrderResponseModel data) = _Loaded;
  const factory Orders4State.error(String message) = _Error;
}
