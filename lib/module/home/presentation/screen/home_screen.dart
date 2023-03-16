import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machinetestpkd/config/ui_themes/app_colors.dart';
import 'package:machinetestpkd/config/ui_themes/app_style.dart';
import 'package:machinetestpkd/constants/app_constants.dart';
import 'package:machinetestpkd/module/home/data/model/shop_model.dart';
import 'package:machinetestpkd/module/home/data/repository/home_repository.dart';
import 'package:machinetestpkd/module/home/presentation/bloc/home_bloc.dart';
import 'package:machinetestpkd/module/login/presentation/screen/login_screen.dart';
import 'package:machinetestpkd/utils/helpers/media_query_helper.dart';
import 'package:machinetestpkd/utils/helpers/shared_prefrence_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ShopModel? shopList;
  late HomeRepository homeRepository;

  @override
  void initState() {
    homeRepository = HomeRepository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(homeRepository: homeRepository)..add(FetchCustomerData()),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeLoading) {
          } else if (state is HomeLoaded) {
            shopList = state.shopModel;
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                backgroundColor: AppColors.redAccent,
                title: Text(home),
                actions: [
                  IconButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              logout,
                            ),
                            content: const Text(
                              'Are you sure want to logout?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  sharedPreferences.remove(isFirstTime).then(
                                    (value) {
                                      print(value);
                                      Navigator.pushReplacement(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (ctx) => SignUpScreen(),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Text(
                                  'Yes',
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'No',
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.logout_outlined,
                    ),
                  ),
                ],
              ),
              body: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeLoaded) {
                    return SafeArea(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: shopList!.data!.length,
                        itemBuilder: (context, index) {
                          final id = shopList!.data![index].id;
                          final name = shopList!.data![index].name;
                          final address1 = shopList!.data![index].address1;
                          final address2 = shopList!.data![index].address2;
                          final address3 = shopList!.data![index].address3;
                          final address4 = shopList!.data![index].address4;
                          return SizedBox(
                            height: getResponsiveSize(context).height * 0.3,
                            child: Card(
                              shape: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.redAccent,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '$id : $name',
                                          style: AppStyles.headerStyle.copyWith(
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    height5,
                                    Text(
                                      address1Text!,
                                      style: AppStyles.headerStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      address1 ?? notAvailable,
                                    ),
                                    height5,
                                    Text(
                                      address2Text,
                                      style: AppStyles.headerStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      address2 == null
                                          ? notAvailable
                                          : address2.isEmpty
                                              ? notAvailable
                                              : address2,
                                    ),
                                    height5,
                                    Text(
                                      address3Text,
                                      style: AppStyles.headerStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      address3 == null
                                          ? notAvailable
                                          : address3.isEmpty
                                              ? notAvailable
                                              : address3,
                                    ),
                                    height5,
                                    Text(
                                      address4Text,
                                      style: AppStyles.headerStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      address4 == null
                                          ? notAvailable
                                          : address4.isEmpty
                                              ? notAvailable
                                              : address4,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is HomeError) {
                    return Center(child: Text(state.message));
                  } else {
                    return Container();
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
