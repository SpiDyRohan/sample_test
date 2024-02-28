import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample_app/networking/api_client.dart';
import 'package:sample_app/response_models/product_list_response.dart';

class ProductListingController extends GetxController{
  TextEditingController queryController=TextEditingController();
  RxList<Products> productsList=<Products>[].obs;
  var showLoader=false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductsAPi();
  }


  void productsearchAPI(String searchquery) async {
    showLoader.value=true;
    var client= ApiClient();
    await client.productSearchApi(searchquery).then((value) {
      showLoader.value=false;
      if(value.products!.isNotEmpty){
        productsList.value=value.products!;
      }else{
        Get.snackbar("Failed", "Something went Wrong!!!!!");
      }
    }).onError((error, stackTrace) {
      showLoader.value=false;
      print("On error ${error}");
      Get.snackbar("Error", error.toString());
    });
  }
  void getProductsAPi() async {
    showLoader.value=true;
    var client= ApiClient();
    await client.productListingApi().then((value) {
      showLoader.value=false;
      if(value.products!.isNotEmpty){
        productsList.value=value.products!;
      }else{
        Get.snackbar("Failed", "Something went Wrong!!!!!");
      }
    }).onError((error, stackTrace) {
      showLoader.value=false;
      print("On error ${error}");
      Get.snackbar("Error", error.toString());
    });
  }

}