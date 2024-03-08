import 'package:get/get.dart';
import 'package:moco/models/order.dart';
import 'package:moco/models/voucher.dart';
import 'package:moco/screen/offer/offer_repo.dart';
import 'package:moco/services/data/offer.dart';

class OfferController extends GetxController implements GetxService {
  final OfferRepo offerRepo;
  OfferController({required this.offerRepo});

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
  List<VoucherModel>? _offers;
  List<VoucherModel>? get offers => _offers;

  Future<void> getOfferList(int offset, bool reload) async {
    _offset = offset;
    _isLoading = true;
    if (_offers == null || reload) {
      _offers = [];
      mockOffers.forEach((key, value) {
        _offers!.add(value);
      });
    }
    _pageSize = 20;
    _isLoading = false;
    update();
  }
}