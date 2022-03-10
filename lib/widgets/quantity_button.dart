
import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  
  int quantity;
  double borderRaduis;
  Function() onIncremnt;
  Function() onDecremnt;

  QuantityButton({required this.quantity, required this.onIncremnt, required this.onDecremnt, this.borderRaduis = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(borderRaduis),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onIncremnt,
            child: const Padding(padding: EdgeInsetsDirectional.only(start: 20, top: 4, bottom: 4),
            child: Text('+',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),),),
          ),
          const SizedBox(width: 16,),
          Text('$quantity',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(width: 16,),
          GestureDetector(
            onTap: onDecremnt,
            child: const Padding(padding: EdgeInsetsDirectional.only(end: 20, top: 4,bottom: 4),
            child: Text('-',
           style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.bold,)
           ),),
          )
        ],
      ),
    );
  }
}