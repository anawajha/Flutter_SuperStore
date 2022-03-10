import 'package:flutter/material.dart';
import 'package:super_store/utls/app_colors.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.notes_rounded),
        title: const Text('HOME',
        style: TextStyle(
          color: Colors.black87
        ),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){},
              icon:const Icon(Icons.search_sharp)),
        ],
        iconTheme: const IconThemeData(
          color: Colors.black87
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(18),
          itemCount: 7,
          cacheExtent: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
          mainAxisSpacing: 21,
          crossAxisSpacing: 16,
          childAspectRatio: 168/314 ),
          itemBuilder: (context, index){
            return Card(
              elevation: 0,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    padding: const EdgeInsets.all(0.7),
                    height: 229,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                          border: Border.all(width: 0.7,color: Colors.grey.shade400),
                    ),
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1/1,
                          child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1rCGZxz-h_GN6qE-3Zva3oBfijmldEBdhyA&usqp=CAU',),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12,top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('White top',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),),
                        Icon(Icons.shopping_cart,color: AppColors.red,size: 16,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12,top: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Women',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12
                        ),),
                        Icon(Icons.favorite_border,color: Colors.black87,size: 16,)
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 2),
                  child: Text('15 \$',
                  style: TextStyle(
                    color: AppColors.red,
                    fontSize: 18
                  ),),),

                ],
              ),
              
            );
          }),
    );
  }
}
