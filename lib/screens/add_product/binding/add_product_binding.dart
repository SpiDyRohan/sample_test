import 'package:get/get.dart';
import 'package:sample_app/screens/add_product/controller/add_product_controller.dart';

class AddProductBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(AddProductController());
  }

}