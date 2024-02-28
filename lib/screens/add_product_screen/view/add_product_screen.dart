import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:sample_app/screens/add_product_screen/controller/add_product_controller.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final controller=Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Product"),
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
                controller: controller.productTitleController,
                decoration: InputDecoration(
                    hintText: "Enter Product Title",
                    border: InputBorder.none),
                onChanged: (value) {
                  print("${value}");
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: controller.productdescriptionController,
                decoration: InputDecoration(
                    hintText: "Enter Product Description",
                    border: InputBorder.none),
                onChanged: (value) {
                  print("${value}");
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: controller.productpriceController,
                decoration: InputDecoration(
                    hintText: "Enter Product Price",
                    border: InputBorder.none),
                onChanged: (value) {
                  print("${value}");
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: controller.productdiscountPercentageController,
                decoration: InputDecoration(
                    hintText: "Enter Product Distcount",
                    border: InputBorder.none),
                onChanged: (value) {
                  print("${value}");
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: controller.productstockController,
                decoration: InputDecoration(
                    hintText: "Enter Product Stock",
                    border: InputBorder.none),
                onChanged: (value) {
                  print("${value}");
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: controller.productbrandController,
                decoration: InputDecoration(
                    hintText: "Enter Product Brand",
                    border: InputBorder.none),
                onChanged: (value) {
                  print("${value}");
                },
              ),
            ),
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
            ElevatedButton(onPressed: () {
              controller.addProduct();
            }, child: Obx(() => controller.showLoader.value?CupertinoActivityIndicator(
              radius: 24,
              color: Colors.purple,
            ):Text("Add Product")))
          ],
        ),
      ),
    );
  }
}
