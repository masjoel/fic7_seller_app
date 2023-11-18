import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/order_remote_datasource.dart';
import '../../data/models/order_response_model.dart';

part 'orders3_event.dart';
part 'orders3_state.dart';
part 'orders3_bloc.freezed.dart';

class Orders3Bloc extends Bloc<Orders3Event, Orders3State> {
  Orders3Bloc() : super(const _Initial()) {
    on<_GetOrders3>((event, emit) async {
      emit(const _Loading());
      final response = await OrderRemoteDatasource().getOrdersStat3();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
