import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:sample_app/screens/product_detail_screen/controller/product_detail_controller.dart';

class ProductDetailBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(ProductDetailController());
  }

}