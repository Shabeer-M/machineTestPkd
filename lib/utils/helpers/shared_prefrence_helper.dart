//initialize sharedPrefs
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

Future<void> initSharedPref() async {
  sharedPreferences = await SharedPreferences.getInstance();
}

//sized boxes and sharedPrefKeys
const  isFirstTime = 'isFirstTime';
const uid = 'uid';
const userName = 'userName';
const password = 'password';