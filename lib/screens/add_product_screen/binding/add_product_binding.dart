import 'package:get/get.dart';
import 'package:sample_app/screens/add_product_screen/controller/add_product_controller.dart';

class AddProductBindings extends Bindings{
  @override
  void dependencies() {
   Get.put(AddProductController());
  }

}