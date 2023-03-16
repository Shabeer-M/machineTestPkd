import 'package:machinetestpkd/constants/app_constants.dart';
import 'package:machinetestpkd/utils/helpers/dio_helper.dart';

class HomeApi {
  final DioHelper _dioHelper = DioHelper();

  getShopModelData({required String unitId}) async {
    final data = {
      unitIdApiCall: unitId,
    };
    final response = await _dioHelper.dio.post(DioHelper.fetchCustomerPath, data: data);
    return response;
  }
}
