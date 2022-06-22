import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'product_controller.dart';
import '../../widgets/product_custom_widgets/product_tile.dart';

class HomePageView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [
                Expanded(
                  child: Text(
                    "ShopMe",
                    style: TextStyle(
                        fontFamily: "avenir",
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
                  () {
                if (productController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else{
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: productController.productList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductTile(productController.productList[index], index);
                    },
                    staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}