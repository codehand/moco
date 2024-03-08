import 'package:get/get.dart';
import 'package:moco/models/order.dart';
import 'package:moco/screen/order/order_repo.dart';
import 'package:moco/services/data/order.dart';

class OrderController extends GetxController implements GetxService {
  final OrderRepo orderRepo;
  OrderController({required this.orderRepo});

  // pagination
  bool _isLoading = false;
  int? _pageSize;
  bool? _isSearching = false;
  String? _type = 'all';
  String? _searchText = '';
  int? _offset = 1;
  bool get isLoading => _isLoading;
  int? get pageSize => _pageSize;
  bool? get isSearching => _isSearching;
  String? get type => _type;
  String? get searchText => _searchText;
  int? get offset => _offset;

  // model
  List<OrderModel>? _orders;
  List<OrderModel>? get orders => _orders;

  Future<void> getOrderList(int offset, bool reload) async {
    _offset = offset;
    _isLoading = true;
    if (_orders == null || reload) {
      _orders = [];
      mockOrders.forEach((key, value) {
        _orders!.add(value);
      });
    }
    _pageSize = 20;
    _isLoading = false;
    update();
  }
}