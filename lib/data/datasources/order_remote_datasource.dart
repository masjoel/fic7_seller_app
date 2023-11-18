import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../common/global_variables.dart';
import '../models/order_response_model.dart';
import 'auth_local_datasource.dart';

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> getOrders() async {
    final userId = await AuthLocalDatasource().getUserId();
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/orders?seller_id=$userId'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Server error');
    }
  }
  Future<Either<String, OrderResponseModel>> getOrdersStat1() async {
    final userId = await AuthLocalDatasource().getUserId();
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/orders?seller_id=$userId&payment_status=1'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Server error');
    }
  }
  Future<Either<String, OrderResponseModel>> getOrdersStat2() async {
    final userId = await AuthLocalDatasource().getUserId();
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/orders?seller_id=$userId&payment_status=2'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Server error');
    }
  }

  Future<Either<String, OrderResponseModel>> getOrdersStat3() async {
    final userId = await AuthLocalDatasource().getUserId();
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/orders?seller_id=$userId&payment_status=3'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Server error');
    }
  }
  Future<Either<String, OrderResponseModel>> getOrdersStat4() async {
    final userId = await AuthLocalDatasource().getUserId();
    final token = await AuthLocalDatasource().getToken();
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(
      Uri.parse('${GlobalVariables.baseUrl}/api/orders?seller_id=$userId&payment_status=4'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else {
      return const Left('Server error');
    }
  }
}
