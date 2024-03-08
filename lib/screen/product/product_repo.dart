import 'package:get/get.dart';
import 'package:moco/services/api.dart';
import 'package:moco/utils/app.dart';

class ProductRepo {
  final APIClient apiClient;

   ProductRepo({required this.apiClient});

  Future<Response> getSkuActiveList(int offset, String section, String keyword) async {
    return await apiClient.postData("${AppConstants.BASE_URL}?q=$section", {
      "get_total": "true",
      "page": offset,
      "page_size": 20,
      "query": keyword,
      "section": section
    });
  }
}