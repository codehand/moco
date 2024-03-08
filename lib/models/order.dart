import 'package:moco/models/customer.dart';
import 'package:moco/models/product.dart';
import 'package:moco/models/seller.dart';

class OrderModel {
  String? id;
  String? code;
  CustomerModel? customerInfo;
  SellerModel? sellerInfo;
  double? totalPrice;
  double? totalDiscount;
  String? note;
  String? status;
  String? createdAt;
  String? updatedAt;

  List<OrderItemModel>? items;

  OrderModel({
    this.id,
    this.code,
    this.customerInfo,
    this.sellerInfo,
    this.totalPrice,
    this.totalDiscount,
    this.note,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.items,
  });
}

class OrderItemModel {
  String? id;
  ProductModel? product;
  double? totalPrice;
  double? totalDiscount;
  int? quantity;
  String? createdAt;
  String? updatedAt;

  OrderItemModel({
    this.id,
    this.product,
    this.totalPrice,
    this.totalDiscount,
    this.quantity,
    this.createdAt,
    this.updatedAt,
  });
}