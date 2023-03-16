import 'package:machinetestpkd/module/home/data/api/home_api.dart';

class HomeRepository {
  final HomeApi _homeApi = HomeApi();

  homeApiCall({
    required String unitId,
  }) async {
    return await _homeApi.getShopModelData(unitId: unitId);
  }
}
