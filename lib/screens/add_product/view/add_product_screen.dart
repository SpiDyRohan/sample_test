import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/screens/add_product/controller/add_product_controller.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final controller = Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Add Product"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Category"),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10),
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

                Text("Product Title"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: controller.productTitleController,
                    decoration: InputDecoration(
                        hintText: "Enter Product Title", border: InputBorder.none),
                    onChanged: (value) {
                      print("${value}");
                    },
                  ),
                ),

                Text("Product Description"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10),
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

                Text("Product Price"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.productpriceController,
                    decoration: InputDecoration(
                        hintText: "Enter Product Price", border: InputBorder.none),
                    onChanged: (value) {
                      print("${value}");
                    },
                  ),
                ),

                Text("Product Discount"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.productdiscountPercentageController,
                    decoration: InputDecoration(
                        hintText: "Enter Product Discount",
                        border: InputBorder.none),
                    onChanged: (value) {
                      print("${value}");
                    },
                  ),
                ),

                Text("Product Stock"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.productstockController,
                    decoration: InputDecoration(
                        hintText: "Enter Product Stock", border: InputBorder.none),
                    onChanged: (value) {
                      print("${value}");
                    },
                  ),
                ),
                Text("Product Rating"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.productRatingController,
                    decoration: InputDecoration(
                        hintText: "Enter Product Rating", border: InputBorder.none),
                    onChanged: (value) {
                      print("${value}");
                    },
                  ),
                ),

                Text("Product Brand"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: controller.productbrandController,
                    decoration: InputDecoration(
                        hintText: "Enter Product Brand", border: InputBorder.none),
                    onChanged: (value) {
                      print("${value}");
                    },
                  ),
                ),

                Center(
                  child:Obx(() => controller.showLoader.value
                      ? CupertinoActivityIndicator(
                    radius: 24,
                    color: Colors.purple,
                  )
                      :  ElevatedButton(
                      onPressed: () {
                        if (controller.productTitleController.text.length > 0 &&
                            controller.productbrandController.text.length > 0 &&
                            controller.productdescriptionController.text.length > 0 &&
                            controller.productdiscountPercentageController.text.length > 0 &&
                            controller.productpriceController.text.length > 0 &&
                            controller.productstockController.text.length > 0) {
                          controller.addProduct();
                        }
                        else{
                          Get.snackbar("Failed", "Please Add Details",backgroundColor: Colors.red,colorText: Colors.white);
                        }
                      },
                      child: Text("Add Product"))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
