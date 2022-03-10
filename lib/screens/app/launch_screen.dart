import 'package:flutter/material.dart';
import 'package:super_store/storage/prefs/user_data_preferences.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, UserDataPreferences().loggedIn() ? '/home_screen' : '/login_screen');
    });
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/background.png',fit: BoxFit.fitWidth,width: double.infinity,),
          Image.asset('assets/images/hover.png',fit: BoxFit.fitWidth,width: double.infinity,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 3,),
                const Text('WELCOME',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),),
                const Spacer(flex: 2,),
                Image.asset('assets/images/logo.png',),
                const Spacer(flex: 2,),
                const Text('SUPERSTORE\nUI KIT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white
                ),),
                const Spacer(flex: 3,),
                const Divider(
                  height: 0,
                    thickness: 0,
                  color: Colors.transparent,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
