import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sample_app/response_models/product_list_response.dart';
import 'package:sample_app/screens/product_screen_listing/controller/product_listing_controller.dart';

import '../../../RouteDetail/routes.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final controller = Get.put(ProductListingController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Products"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.productsbyCategory);
                    },
                    child: Text("BY CATEGORY")),
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: controller.queryController,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {
                            if(controller.queryController.text != ""){
                              controller.getProductsAPi();
                            }
                            controller.queryController.text = "";
                            FocusManager.instance.primaryFocus!.unfocus();
                          },
                          child: Icon(Icons.close)),
                      hintText: "Search Here",
                      border: InputBorder.none),
                  onChanged: (value) {
                    print("${value}");
                    controller.productsearchAPI(value);
                  },
                ),
              ),
              Obx(
                () => controller.showLoader.value
                    ? Align(
                        alignment: Alignment.center,
                        child: CupertinoActivityIndicator(
                          color: Colors.purple,
                          radius: 40,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: controller.productsList.value.length,
                          itemBuilder: (context, index) {
                            final product =
                                controller.productsList.value[index];
                            return ProductCard(
                              productid: product.id!,
                              title: product.title!,
                              description: product.description!,
                              price: product.price!,
                              discountPercentage: product.discountPercentage!,
                              rating: product.rating!,
                              stock: product.stock!,
                              thumbnailUrl: product.thumbnail!,
                            );
                          },
                        ),
                      ),
              ),
            ],
          )),
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
        onTap: () {
          Get.toNamed(Routes.productDetail,
              arguments: {"productID": productid});
        },
      ),
    );
  }
}
