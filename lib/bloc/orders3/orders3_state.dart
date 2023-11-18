part of 'orders3_bloc.dart';

@freezed
class Orders3State with _$Orders3State {
  const factory Orders3State.initial() = _Initial;
  const factory Orders3State.loading() = _Loading;
  const factory Orders3State.loaded(OrderResponseModel data) = _Loaded;
  const factory Orders3State.error(String message) = _Error;
}
