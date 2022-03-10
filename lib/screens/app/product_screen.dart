import 'package:flutter/material.dart';
import 'package:super_store/utls/app_colors.dart';
import 'package:super_store/widgets/quantity_button.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBlack,
        title: const Text('Head Phone',
          style: TextStyle(
              color: Colors.white
          ),),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border))
        ],
      ),
      body: ListView(
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            height: 194,
            color: AppColors.lightBlack,
            child: SizedBox(
              width: 182,
              height: 182 ,
              child: AspectRatio(
                  aspectRatio: 1/1,
              child : Image.asset('assets/images/Image.png',fit: BoxFit.fill,)),
            ),
          ),
         ListView(
           padding: const EdgeInsets.all(20),
           shrinkWrap: true,
           physics: const NeverScrollableScrollPhysics(),
           children: [
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Gucci Sunglasses',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                ),),
              Text('45 \$',
              style:TextStyle(
                fontSize: 22,
                color: Colors.black87
              ),),
            ],
          ),
          const SizedBox(height: 20,),
          const Text('Description',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 8,),
          const Text('If you’re offered a seat on a rocket ship, don’t ask what seat! Just get on board and move the sail towards the destination.',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12
          ),),
          const SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){},
               child: const Text('ADD TO CART',
               style: TextStyle(
                 color: Colors.white
               ),
               ),
               style: ElevatedButton.styleFrom(
                 primary: AppColors.red,
                 minimumSize: const Size(0, 50),
                 padding: const EdgeInsets.symmetric(horizontal: 30),
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(27),
                 ) ),),
                QuantityButton(
                  quantity: _quantity,
                  borderRaduis: 18,
                  onIncremnt: (){
                    setState(() {
                      if(_quantity < 10) ++_quantity;
                    });
                  },
                  onDecremnt: (){
                    setState(() {
                      if (_quantity > 1) --_quantity;
                    });
                  },
                ),
            ],
          ),
          const SizedBox(height: 14,),
          const Text('You May Also Like',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),),
          const SizedBox(height: 14,),
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 25,),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0.7),
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.7,color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: AspectRatio(aspectRatio: 1/1,
                        child: Image.asset('assets/images/Image.png',fit: BoxFit.fill,),),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(top: 10, bottom: 10, end: 10),
                                    child: Icon(Icons.shopping_bag,color: AppColors.red,size: 18,),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(Icons.favorite_border, color: Colors.grey,size: 18,),
                                  ),
                                ],
                              )
                          ],
                        ),)
                    ],
                  )),
           ],
         )

        ],
      ),
    );
  }
}


