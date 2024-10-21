import 'package:flutter/material.dart';

import '../../helper/helper.dart';

class TicketSelection extends StatelessWidget{
  const TicketSelection({super.key, required this.tableType, required this.price});
  final String tableType;
  final double price;

  String get formattedPrice{
    final priceNumber = price.toInt().toString();
    print(priceNumber);
    List<String> strPrice = priceNumber.split('').reversed.toList();
    List<String> priceString = [];
    int counter = 0;
    for(int i = 0; i < strPrice.length; i++){
      counter++;
      priceString.add(strPrice[i]);
      if(counter % 3 == 0) priceString.add(',');
    }
    final resultList = priceString.reversed.toList();
    String result = '';
    for(String s in resultList){
      result += s;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    print(formattedPrice);
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Helper.hexToColor('#F6F0E9'),
          borderRadius: BorderRadius.circular(6)
      ),
      child: Row(
        children: [
          const SizedBox(width: 10,),
          Text('Table of 4 (VIP)',
            style: TextStyle(
                color: Helper.hexToColor('#242426'),
                fontSize: 16
            ),
          ),
          const SizedBox(width: 76,),
          Text('NGN $formattedPrice',
            style: TextStyle(
                color: Helper.hexToColor('#242426'),
                fontSize: 16
            ),
          ),
        ],
      ),
    );
  }
}