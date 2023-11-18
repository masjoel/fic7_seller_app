import 'dart:convert';

class OrderResponseModel {
    final List<Orders> data;

    OrderResponseModel({
        required this.data,
    });

    factory OrderResponseModel.fromJson(String str) => OrderResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OrderResponseModel.fromMap(Map<String, dynamic> json) => OrderResponseModel(
        data: List<Orders>.from(json["data"].map((x) => Orders.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Orders {
    final int id;
    final int userId;
    final int sellerId;
    final String number;
    final String totalPrice;
    final String paymentStatus;
    final dynamic paymentUrl;
    final dynamic deliveryAddress;
    final dynamic shipper;
    final dynamic shippingCost;
    final DateTime createdAt;
    final DateTime updatedAt;

    Orders({
        required this.id,
        required this.userId,
        required this.sellerId,
        required this.number,
        required this.totalPrice,
        required this.paymentStatus,
        required this.paymentUrl,
        required this.deliveryAddress,
        required this.shipper,
        required this.shippingCost,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Orders.fromJson(String str) => Orders.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Orders.fromMap(Map<String, dynamic> json) => Orders(
        id: json["id"],
        userId: json["user_id"],
        sellerId: json["seller_id"],
        number: json["number"],
        totalPrice: json["total_price"],
        paymentStatus: json["payment_status"],
        paymentUrl: json["payment_url"],
        deliveryAddress: json["delivery_address"],
        shipper: json["shipper"],
        shippingCost: json["shipping_cost"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "seller_id": sellerId,
        "number": number,
        "total_price": totalPrice,
        "payment_status": paymentStatus,
        "payment_url": paymentUrl,
        "delivery_address": deliveryAddress,
        "shipper": shipper,
        "shipping_cost": shippingCost,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
