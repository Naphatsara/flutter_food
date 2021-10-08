import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_food/models/food_item.dart';

class FoodDetails extends StatefulWidget {
  static const routeName = '/fooddetails';
  const FoodDetails({Key? key}) : super(key: key);

  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as FoodItem ;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/${item.image}',

            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(' ชื่อเมนู : ' + item.name,style: TextStyle(fontSize: 30),),
              Text(' ราคา : ' + item.price.toString(),style: TextStyle(fontSize: 30),),
            ],
          )
        ],
      ),
    );
  }
}
