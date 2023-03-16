import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machinetestpkd/module/home/data/model/shop_model.dart';
import 'package:machinetestpkd/module/home/data/repository/home_repository.dart';
import 'package:machinetestpkd/utils/helpers/shared_prefrence_helper.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository homeRepository = HomeRepository();
  ShopModel? shopList;
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<FetchCustomerData>((event, emit) async {
      emit(HomeLoading());
      final id = sharedPreferences.getString(uid);
      try {
        final response = await homeRepository.homeApiCall(unitId: id.toString());

        if (response.statusCode == 200) {
          shopList = ShopModel.fromJson(response.data);
          emit(HomeLoaded(shopModel: shopList!));
        } else {
          emit(const HomeError(message: 'Error fetching customer data'));
        }
      } catch (error) {
        emit(const HomeError(message: 'Error fetching customer data'));
      }
    });
  }
}
