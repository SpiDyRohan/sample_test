
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sample_app/response_models/add_product_response/add_product_response.dart';
import 'package:sample_app/response_models/productDetailResponse/product_detail_response.dart';
import 'package:sample_app/response_models/product_list_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com/')
abstract class ApiClient{
 factory ApiClient(){
   Dio dio = Dio(BaseOptions(contentType: "application/json"));
   dio.options = BaseOptions(
       receiveTimeout: const Duration(milliseconds: 30000),
       connectTimeout: const Duration(milliseconds: 30000));
   // dio.options.headers['appVersion'] = Utility.appBuildNumber;
   // dio.options.headers['deviceType'] = Platform.isAndroid ? "android" : "ios";
   // dio.options.headers['deviceId'] = Utility.deviceId;

   dio.interceptors.add(PrettyDioLogger(
       requestBody: true,
       requestHeader: true,
       responseBody: true,
       responseHeader: true));

   return _ApiClient(dio);
 }

 @GET('/products')
 Future<ProductListResponse> productListingApi();


 @GET('/products/search')
 Future<ProductListResponse> productSearchApi(@Query("q") String query);


 @POST('/products/add')
 Future<AddProductResponse> addProduct(@Body() Map<String, dynamic> body);


 @GET('/products/categories')
 Future<List<String>> productCategoryApi();


 @GET('/products/{productId}')
 Future<ProductDetailResponse> productDetailApi(@Path("productId") int productId);


}