import 'package:get/get.dart';

import '../controller/products-by_category_controller.dart';

class ProductsByCategoryBindings extends Bindings{
  @override
  void dependencies() {
   Get.put(ProductsByCategoryController());
  }

}