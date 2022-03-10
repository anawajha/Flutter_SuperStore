import 'package:flutter/material.dart';
import 'package:super_store/screens/app/product_screen.dart';
import 'package:super_store/screens/app/home_screen.dart';
import 'package:super_store/screens/app/launch_screen.dart';
import 'package:super_store/screens/app/test_screen.dart';
import 'package:super_store/screens/auth/forget_password_screen.dart';
import 'package:super_store/screens/auth/login_screen.dart';
import 'package:super_store/screens/app/main_screen.dart';
import 'package:super_store/screens/app/settings_screen.dart';
import 'package:super_store/screens/auth/register_screen.dart';
import 'package:super_store/screens/auth/reset_password_screen.dart';
import 'package:super_store/storage/prefs/user_data_preferences.dart';

import 'screens/app/account_screen.dart';
import 'screens/app/cart_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserDataPreferences().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //UserLoginController().login(email: 'flutter11@api.com', password: '123123');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen' : (context) => const LaunchScreen(),
        '/login_screen' : (context) => const LoginScreen(),
        '/main_screen' : (context) => const MainScreen(),
        '/home_screen' : (context) => const HomeScreen(),
        '/cart_screen' : (context) => const CartScreen(),
        '/account_screen' : (context) => const AccountScreen(),
        '/settings_screen' : (context) => const SettingsScreen(),
        '/product_screen' : (context) => const ProductScreen(),
        '/test_screen' : (context) => const TestScreen(),
        '/register_screen' : (context) => const RegisterScreen(),
        '/forget_password_screen' : (context) => const ForgetPasswordScreen(),
        //'/reset_password_screen' : (context) => const ResetPasswordScreen(),
      },
    );
  }
}
