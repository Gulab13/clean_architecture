import 'package:get/get.dart';

import '../../../data/services/http_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = [].obs;

  var isLoadingDetail = true.obs;
  var productDetail = [].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await HttpService.fetchProducts();
      productList.value = products;
    } finally {
      isLoading(false);
    }
  }

  void fetchSingleProducts(int num) async {
    try {
      isLoadingDetail(true);
      var productsdetail = await HttpService.fetchsingleProducts(num);
      productDetail.value = productsdetail;
    } finally {
      isLoading(false);
    }
  }
}
