import 'package:get/get.dart';
import 'package:moco/models/product.dart';
import 'package:moco/screen/product/product_repo.dart';
import 'package:moco/services/data/product.dart';

class ProductController extends GetxController implements GetxService {
  final ProductRepo productRepo;
  ProductController({required this.productRepo});

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
  List<ProductModel>? _products;
  List<ProductModel>? get products => _products;

  Future<void> getProductList(int offset, bool reload) async {
    _offset = offset;
    _isLoading = true;
    if (_products == null || reload) {
      _products = [];
      mockProducts.forEach((key, value) {
        _products!.add(value);
      });
    }
    _pageSize = 20;
    _isLoading = false;
    update();
  }
}