import 'package:flutter/material.dart';
import 'package:super_store/storage/prefs/user_data_preferences.dart';
import 'package:super_store/widgets/account_settings_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userData = UserDataPreferences().getCurrentUserData();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.notes)),
        title: const Text('Account',
        style: TextStyle(
          color: Colors.black87,
        ),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search_sharp))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black87
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/Image.png'),
              ),
              const SizedBox(width: 30,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userData.fullName,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                  ),),
                  const SizedBox(height: 4,),
                  Text(userData.email,
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 13,
                  ),),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30,),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => AccountSettings(icon: Icons.favorite_outline, title: 'Favorites',hasAdditionSettings: true,isNew: true,),
              separatorBuilder: (context, index) => const SizedBox(height: 10,),
              itemCount: 9)
        ],
      ),
    );
  }
}
