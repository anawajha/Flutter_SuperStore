import 'package:flutter/material.dart';
import 'package:super_store/api/app/user_controller.dart';

import '../../models/user.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({ Key? key }) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List<User> users = <User>[];
  late Future<List<User>> _future;

  @override
  void initState() {
    super.initState();
    _future =  UserApiController().users();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users',
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<User>>(
        future: _future,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(snapshot.hasData && snapshot.data!.isNotEmpty) {
            users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.person),
                title: Text("${users[index].firstName} ${users[index].lastName}"),
                subtitle: Text(users[index].email),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),);
          }else{
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.warning,size: 55, color: Colors.grey.shade300,),
                const Divider(
                  height: 10,
                  color: Colors.transparent,),
                Text('No Users found',
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.bold, 
                  fontSize: 20),)
              ],
            );
          }
        }),

          
    );
  }
}