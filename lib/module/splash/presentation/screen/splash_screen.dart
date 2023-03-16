import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machinetestpkd/module/home/data/repository/home_repository.dart';
import 'package:machinetestpkd/module/home/presentation/bloc/home_bloc.dart';
import 'package:machinetestpkd/module/home/presentation/screen/home_screen.dart';
import 'package:machinetestpkd/module/login/data/repository/login_repository.dart';
import 'package:machinetestpkd/module/login/presentation/bloc/login_bloc.dart';
import 'package:machinetestpkd/module/login/presentation/screen/login_screen.dart';
import 'package:machinetestpkd/utils/helpers/shared_prefrence_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final HomeRepository homeRepository = HomeRepository();
  final LoginRepository _loginRepository = LoginRepository();
  late HomeBloc homeBloc;

  late LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc(homeRepository: homeRepository);
    loginBloc = LoginBloc(loginRepository: _loginRepository);
    Timer(const Duration(seconds: 3), () {
      // isLoggedIn();
    });
  }

  Future<void> isLoggedIn() async {
    if (sharedPreferences.getBool(isFirstTime) == null || sharedPreferences.getBool(isFirstTime) == false) {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (ctx) => SignUpScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
          builder: (ctx) => const HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => homeBloc),
          BlocProvider(create: (BuildContext context) => loginBloc),
        ],
        child: MaterialApp(
          theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: SignUpScreen(),
        ));
  }
}
