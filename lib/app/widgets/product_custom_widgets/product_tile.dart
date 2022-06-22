import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../../pages/product/product_controller.dart';
import 'detail_page_view.dart';
import '../../../domain/entities/models/products_model.dart';

class ProductTile extends StatelessWidget {
  final ProductsModel product;
  int? number;
  ProductTile(this.product, this.number, {Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        productController.fetchSingleProducts(number!);
        Get.to(ProductDetailPage(product));
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: product.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Positioned(child: Obx(()=>CircleAvatar(backgroundColor: Colors.white, child: IconButton(icon: product.,),)))
                ],
              ),
              const SizedBox(height: 8),
              Text(
                product.title!,
                maxLines: 2,
                style: const TextStyle(
                    fontFamily: 'avenir', fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              if (product.rating != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product.rating!.rate.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 8),
              Text('\$${product.price}',
                  style: const TextStyle(fontSize: 32, fontFamily: 'avenir')),
            ],
          ),
        ),
      ),
    );
  }
}
