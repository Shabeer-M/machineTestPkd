import 'package:dio/dio.dart';

class DioHelper {
  //base url & end points
  static const String baseUrl = 'http://mfiapp.safeandsmartbank.com:6583/api/v1.0/';
  static const String userLoginPath = 'user/signin';
  static const String fetchCustomerPath = 'inv/fetchCustomer';

//initialize a dio object with base url
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
}
