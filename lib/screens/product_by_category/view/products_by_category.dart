import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../../RouteDetail/routes.dart';
import '../controller/products-by_category_controller.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  const ProductsByCategoryScreen({super.key});

  @override
  State<ProductsByCategoryScreen> createState() => _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {
  final controller = Get.put(ProductsByCategoryController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Products By Category"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.addProductScreen);
                  },
                  child: Icon(Icons.add)),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Obx(() => DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text("Select Category"),
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: controller.selectedCategory.value.isNotEmpty
                          ? controller.selectedCategory.value
                          : null,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.selectedCategory.value = newValue;
                          controller.categoryListingApi(newValue!);
                        }
                      },
                      items: controller.categoryList?.value.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )),
            ),
            Expanded(
              child: Obx(() => controller.showListingLoader.value?CupertinoActivityIndicator(
                color: Colors.purple,
                radius: 40,
              ):ListView.builder(
                itemCount: controller.categoryProductsList.value.length,
                itemBuilder: (context, index) {
                  var categoryProducts =
                  controller.categoryProductsList.value[index];
                  return ProductCard(
                      productid: categoryProducts.id!,
                      title: categoryProducts.title!,
                      description: categoryProducts.description!,
                      price: categoryProducts.price!,
                      discountPercentage: categoryProducts.discountPercentage!,
                      rating: categoryProducts.rating!,
                      stock: categoryProducts.stock!,
                      thumbnailUrl: categoryProducts.thumbnail!);
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final int productid;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String thumbnailUrl;

  ProductCard({
    required this.productid,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          thumbnailUrl,
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            Text('Price: \$${price.toStringAsFixed(2)}'),
            Text('Discount: ${discountPercentage.toStringAsFixed(2)}%'),
            Text('Rating: $rating'),
            Text('Stock: $stock'),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
