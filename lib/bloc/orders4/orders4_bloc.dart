import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/datasources/order_remote_datasource.dart';
import '../../data/models/order_response_model.dart';

part 'orders4_event.dart';
part 'orders4_state.dart';
part 'orders4_bloc.freezed.dart';

class Orders4Bloc extends Bloc<Orders4Event, Orders4State> {
  Orders4Bloc() : super(const _Initial()) {
    on<_GetOrders4>((event, emit) async {
      emit(const _Loading());
      final response = await OrderRemoteDatasource().getOrdersStat4();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
