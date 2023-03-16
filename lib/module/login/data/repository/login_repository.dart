import 'package:machinetestpkd/module/login/data/api/login_api.dart';

class LoginRepository {
  final LoginApi _loginApi = LoginApi();

  loginApiCall({required String unitId, required String userName, required String password}) async {
    return await _loginApi.login(id: unitId, userName: userName, password: password);
  }
}
