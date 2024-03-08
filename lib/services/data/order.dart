import 'package:moco/models/customer.dart';
import 'package:moco/models/order.dart';
import 'package:moco/models/seller.dart';
import 'package:moco/services/data/product.dart';

Map<int, OrderModel> mockOrders = {
  0: OrderModel(
    id: "1",
    code: "A123",
    customerInfo: CustomerModel(
      id: "1",
      code: "A1",
      customerName: "Tien Phat",
      customerPhone: "0123456789",
      customerAddress: "6 Le Duan",
      isVerified: true,
    ),
    sellerInfo: SellerModel(
      id: "1",
      code: "A1",
      sellerName: "Cua hang so 1",
      sellerPhone: "034034456",
      sellerClass: "seller-ext-1",
      sellerAddress: "DN10, Tan Hung Thuan, Q.12"
    ),
    totalPrice: 2500000,
    note: "Giao gio hanh chanh",
    status: "Đã giao",
    items: [
      OrderItemModel(
        id: "1",
        product: mockProducts[1],
        quantity: 1,
        totalPrice: mockProducts[1]!.getPriceValue() * 1
      ),
    ],
  ),
  1: OrderModel(
    id: "2",
    code: "A124",
    customerInfo: CustomerModel(
      id: "1",
      code: "A1",
      customerName: "Tien Phat",
      customerPhone: "0123456789",
      customerAddress: "6 Le Duan",
      isVerified: true,
    ),
    sellerInfo: SellerModel(
      id: "1",
      code: "A1",
      sellerName: "Cua hang so 1",
      sellerPhone: "034034456",
      sellerClass: "seller-ext-1",
      sellerAddress: "DN10, Tan Hung Thuan, Q.12"
    ),
    totalPrice: mockProducts[0]!.getPriceValue() * 1,
    note: "Giao gio hanh chanh",
    status: "Đã giao",
    items: [
      OrderItemModel(
        id: "1",
        product: mockProducts[0],
        quantity: 1,
        totalPrice: mockProducts[0]!.getPriceValue() * 1
      ),
    ],
  ),
  2: OrderModel(
    id: "3",
    code: "A125",
    customerInfo: CustomerModel(
      id: "1",
      code: "A1",
      customerName: "Tien Phat",
      customerPhone: "0123456789",
      customerAddress: "6 Le Duan",
      isVerified: true,
    ),
    sellerInfo: SellerModel(
      id: "1",
      code: "A1",
      sellerName: "Cua hang so 1",
      sellerPhone: "034034456",
      sellerClass: "seller-ext-1",
      sellerAddress: "DN10, Tan Hung Thuan, Q.12"
    ),
    totalPrice: mockProducts[0]!.getPriceValue() * 1,
    note: "Giao gio hanh chanh",
    status: "Đang giao hàng",
    items: [
      OrderItemModel(
        id: "1",
        product: mockProducts[0],
        quantity: 1,
        totalPrice: mockProducts[0]!.getPriceValue() * 1
      ),
    ],
  ),
};