import 'package:get/get.dart';
import 'package:sample_app/RouteDetail/routes.dart';
import 'package:sample_app/screens/SplashScreen/splash_screen.dart';
import 'package:sample_app/screens/add_product_screen/binding/add_product_binding.dart';
import 'package:sample_app/screens/add_product_screen/view/add_product_screen.dart';
import 'package:sample_app/screens/product_detail_screen/binding/product_detail_binding.dart';
import 'package:sample_app/screens/product_detail_screen/view/product_detail_screen.dart';
import 'package:sample_app/screens/product_screen_listing/binding/product_listing_binding.dart';
import 'package:sample_app/screens/product_screen_listing/view/product_list_screen.dart';

class AppPages {
  static const initialRoute = Routes.splash;
  static final routes = [
    GetPage(name: Routes.splash, page: () => SplashScreen(),),
    GetPage(name: Routes.productListing, page: () => ProductListScreen(),binding: ProductListBinding()),
    GetPage(name: Routes.productDetail, page: () => ProductDetailScreen(),binding: ProductDetailBinding()),
    GetPage(name: Routes.addProductScreen, page: () => AddProductScreen(),binding: AddProductBindings()),

  ];
}
