import 'package:flutter/material.dart';
import 'package:machinetestpkd/utils/helpers/shared_prefrence_helper.dart';
import 'module/splash/presentation/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSharedPref();
  runApp(const SplashScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Machine Test',
      home: const SplashScreen(),
    );
  }
}
