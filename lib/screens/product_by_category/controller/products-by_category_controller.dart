import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample_app/networking/api_client.dart';
import 'package:sample_app/response_models/category_listing_response/category_listing_response.dart';

class ProductsByCategoryController extends GetxController{

  RxList<String> categoryList=<String>[].obs;
  RxList<CategoryProducts> categoryProductsList=<CategoryProducts>[].obs;
  var selectedCategory="".obs;
  var showLoader=false.obs;
  var showListingLoader=false.obs;
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
        categoryListingApi(categoryList.value[0]);
      }
    }).onError((error, stackTrace) {

    });
  }

  void categoryListingApi(String tag) async {
    showListingLoader.value=true;
    var client=ApiClient();
    await client.categoryListingApi(tag).then((value) {
      showListingLoader.value=false;
      categoryProductsList.value=value.products!;

    }).onError((error, stackTrace) {
      showListingLoader.value=false;

    });
  }

}