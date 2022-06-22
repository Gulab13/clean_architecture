import 'package:http/http.dart' as http;

import '../../domain/entities/models/products_model.dart';


class HttpService {
  static Future<List<ProductsModel>> fetchProducts() async {
    var response =
    await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      var data = response.body;
      return productsModelFromJson(data);
    } else {
      throw Exception();
    }
  }

  static Future<List<ProductsModel>> fetchsingleProducts(int num) async {
    var response =
    await http.get(Uri.parse("https://fakestoreapi.com/products/$num"));
    if (response.statusCode == 200) {
      var datadetail = response.body;
      return productsModelFromJson(datadetail);
    } else {
      throw Exception();
    }
  }
}