import 'package:flutter/material.dart';
class FoodListPage extends StatefulWidget {
  static const routeName = '/foodlist';
  const FoodListPage({Key? key}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'FOOD MENU',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
