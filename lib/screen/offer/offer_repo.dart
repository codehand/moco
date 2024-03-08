import 'package:get/get.dart';
import 'package:moco/services/api.dart';
import 'package:moco/utils/app.dart';

class OfferRepo {
  final APIClient apiClient;

   OfferRepo({required this.apiClient});

  Future<Response> getOfferList(int offset, String section, String keyword) async {
    return await apiClient.postData("${AppConstants.BASE_URL}?q=$section", {
      "get_total": "true",
      "page": offset,
      "page_size": 20,
      "query": keyword,
      "section": section
    });
  }
}