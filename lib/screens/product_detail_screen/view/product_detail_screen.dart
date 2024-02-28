import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:sample_app/screens/product_detail_screen/controller/product_detail_controller.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final controller = Get.put(ProductDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => controller.showLoader.value
          ? Center(
              child: CupertinoActivityIndicator(
                color: Colors.purple,
                radius: 40,
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: Get.height / 3.1,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {},
                    padEnds: true,
                    itemCount: controller.productDetail.value.images?.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                          fit: BoxFit.fill,
                          controller.productDetail.value.images![index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.productDetail.value.title!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Description:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(                        controller.productDetail.value.description!,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Price: \$${controller.productDetail.value.price!.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Discount: ${controller.productDetail.value.discountPercentage}%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Rating: ${controller.productDetail.value.rating}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Stock: ${controller.productDetail.value.stock}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
    ));
  }
}
