import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/order_remote_datasource.dart';
import '../../data/models/order_response_model.dart';

part 'orders2_event.dart';
part 'orders2_state.dart';
part 'orders2_bloc.freezed.dart';

class Orders2Bloc extends Bloc<Orders2Event, Orders2State> {
  Orders2Bloc() : super(const _Initial()) {
    on<_GetOrders2>((event, emit) async {
      emit(const _Loading());
      final response = await OrderRemoteDatasource().getOrdersStat2();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
