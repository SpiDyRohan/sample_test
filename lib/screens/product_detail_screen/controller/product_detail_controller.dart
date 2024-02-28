import 'package:get/get.dart';
import 'package:sample_app/networking/api_client.dart';
import 'package:sample_app/response_models/productDetailResponse/product_detail_response.dart';

class ProductDetailController extends GetxController{
  int productID = 0;
  var showLoader=false.obs;
  Rx<ProductDetailResponse> productDetail=ProductDetailResponse().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    productID=Get.arguments["productID"];
    productDetailAPi();

  }


  void productDetailAPi() async{
    showLoader.value=true;
    var client =ApiClient();
    await client.productDetailApi(productID).then((value) {
      showLoader.value=false;
     productDetail.value=value;
    }).onError((error, stackTrace) {
      showLoader.value=false;
   print("on error ${error}");
    });
  }

}