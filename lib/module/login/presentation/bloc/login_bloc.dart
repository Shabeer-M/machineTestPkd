import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machinetestpkd/constants/app_constants.dart';
import 'package:machinetestpkd/module/login/data/repository/login_repository.dart';
import 'package:machinetestpkd/utils/helpers/shared_prefrence_helper.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository = LoginRepository();

  LoginBloc({required this.loginRepository}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      final response = await loginRepository.loginApiCall(unitId: event.id, userName: event.username, password: event.password);
      if (response.data[dataApiCall][0][statusApiCall] == 200) {
        await sharedPreferences.setString(uid, event.id);
        await sharedPreferences.setString(userName, event.username);
        await sharedPreferences.setString(password, event.password);
        sharedPreferences.setBool(isFirstTime, true);
        emit(
          LoginSuccess(
            message: response.data[dataApiCall][0][statusMessageApiCall],
            isLogged: true,
          ),
        );
      } else if (response.data[dataApiCall][0][statusApiCall] != 200) {
        emit(
          LoginFailure(
            error: response.data[dataApiCall][0][statusMessageApiCall],
            isFailed: true,
          ),
        );
      }
    });
  }
}
