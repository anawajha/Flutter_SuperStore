import 'package:flutter/material.dart';
import 'package:super_store/utls/app_colors.dart';
import 'package:super_store/widgets/quantity_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sopping Cart'),
        centerTitle: true,
        backgroundColor: AppColors.lightBlack,
        elevation: 0,
        leading: const Icon(Icons.notes),
        actions: [
          IconButton(onPressed:(){},
           icon: const Icon(Icons.search_sharp))
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 180,
            color: AppColors.lightBlack,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Your Order',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                  ),),
                  Text('Order No. #123-456',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),)
                ],
              ),
            ),
          ),
          ListView.separated(
            padding: const EdgeInsets.all(20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (constex, index) => SizedBox(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0.7),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.7,color: Colors.grey.shade400)
                    ),
                    child: AspectRatio(
                      aspectRatio: 1/1,
                      child: Image.asset('assets/images/Image.png',),),
                  ),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('White Dress',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),),
                            Text('15 \$',
                            style: TextStyle(
                              color: AppColors.red,
                              fontSize: 16,
                            ),),
                          ],
                        ),
                        const SizedBox(height: 4,),
                        const Text('Women',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11
                        ),),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            QuantityButton(
                              quantity: _quantity,
                               onIncremnt: (){
                                 setState(() {
                                   if (_quantity < 10) ++_quantity ;
                                 });
                               },
                                onDecremnt: (){
                                  setState(() {
                                    if(_quantity > 1) --_quantity;
                                  });
                                }),
                                Container(
                                  height: 36.6,
                                  width: 35.3,
                                  color: AppColors.red,
                                  child: const Icon(Icons.delete, color: Colors.white,),
                                )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 22,),
            itemCount: 3),
  
          ElevatedButton(
            onPressed: (){},
             child: const Text('PROCEED TO CHECKOUT'),
             style: ElevatedButton.styleFrom(
               primary: AppColors.red,
               minimumSize: const Size(double.infinity, 50),
             ),),
        ],
      ),
    );
  }
}
