import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../networking/api_client.dart';

class AddProductController extends GetxController{
  TextEditingController productTitleController=TextEditingController();
  TextEditingController productdescriptionController=TextEditingController();
  TextEditingController productpriceController=TextEditingController();
  TextEditingController productdiscountPercentageController=TextEditingController();
  TextEditingController productstockController=TextEditingController();
  TextEditingController productbrandController=TextEditingController();
  var showLoader=false.obs;
  var selectedCategory="".obs;
  RxList<String> categoryList=<String>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategoryListApi();
  }

  void getCategoryListApi() async {
    var client =ApiClient();
    await client.productCategoryApi().then((value) {
      if(value.isNotEmpty){
        categoryList.value=value;
      }
    }).onError((error, stackTrace) {

    });
  }

  void addProduct() async {
    showLoader.value=true;
    var body={
      "title": productTitleController.text,
      "description": productdescriptionController.text,
      "price": productpriceController.text,
      "discountPercentage": productdiscountPercentageController.text,
      "rating": 4.69,
      "stock": productstockController.text,
      "brand": productbrandController.text,
      "category": selectedCategory.value
    };
    var client= ApiClient();
    await client.addProduct(body).then((value) {
      showLoader.value=false;
      Get.snackbar("Success", "Product Added Successfully",backgroundColor: Colors.green,colorText: Colors.white);


    }).onError((error, stackTrace) {
      showLoader.value=false;
    });
  }


}