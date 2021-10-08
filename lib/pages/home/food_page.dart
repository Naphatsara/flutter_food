import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/foodlist_page.dart';

class FoodPage extends StatefulWidget {
  static const routeName = '/food';

  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex, //ไฮไลท์ bottom icon
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
      //drawer: Homepage(),
      body: _selectedBottomNavIndex == 0
          ? FoodListPage()
          : Container(
              child: Center(
                child: Text('YOUR ORDER',
                    style: Theme.of(context).textTheme.headline1),
              ),
            ),
    );
  }
}
