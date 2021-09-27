import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/foodlist_page.dart';
import 'package:flutter_food/pages/home/home_page.dart';
class FoodPage extends StatefulWidget {
  static const routeName = '/food';
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var _selectedBottomNavIndex = 0;
  static const List<Widget> _showText = <Widget>[
    Text(
      'FOOD MENU',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
    ),
    Text(
      'YOUR ORDER',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food'),),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex, //ไฮไลท์ bottom icon
        onTap: (index){
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
      //drawer: Homepage(),
      body: Center(
        child: _showText.elementAt(_selectedBottomNavIndex),
      ),
    );
  }
}
