import 'package:flutter/foundation.dart';
import 'package:machinetestpkd/constants/app_constants.dart';
import 'package:machinetestpkd/utils/helpers/dio_helper.dart';

class LoginApi {
  final DioHelper _dioHelper = DioHelper();
  login({required String id, required String userName, required String password}) async {
    try {
      final data = {
        unitIdApiCall: id,
        userNameApiCall: userName,
        passwordApiCall: password,
      };

      final response = await _dioHelper.dio.post(DioHelper.userLoginPath, data: data);
      return response;

    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
