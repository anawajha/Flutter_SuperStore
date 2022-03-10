import 'package:flutter/material.dart';
import 'package:super_store/screens/app/account_screen.dart';
import 'package:super_store/utls/app_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AccountScreen(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,color: Colors.grey, size: 24,),
            activeIcon: Icon(Icons.home_outlined,color: AppColors.red, size: 24,),
          label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined,color: Colors.grey,size: 24,),
          activeIcon: Icon(Icons.shopping_cart_outlined,color : AppColors.red, size: 24,),
          label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline,color: Colors.grey,size: 24,),
          activeIcon: Icon(Icons.person_outline,color : AppColors.red, size: 24,),
          label: 'Account'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined,color: Colors.grey, size: 24,),
          activeIcon: Icon(Icons.settings_outlined,color : AppColors.red, size: 24,),
          label: 'Settings'),
        ],
      ),
    );
  }
}
