import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sample_app/screens/product_screen_listing/controller/product_listing_controller.dart';

class ProductListBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(ProductListingController());
  }

}