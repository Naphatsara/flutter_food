import 'package:flutter/material.dart';
import 'package:flutter_food/models/food_details.dart';
import 'package:flutter_food/pages/home/food_page.dart';
import 'package:flutter_food/pages/home/foodlist_page.dart';
import 'package:flutter_food/pages/home/home_page.dart';
import 'package:flutter_food/pages/home/order_page.dart';
import 'package:flutter_food/pages/home/profile_page.dart';
import 'package:flutter_food/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 14.0),
        ),
      ),
      //home: LoginPage(),
      routes: { //กำหนด routes แทนว่าจะไปที่หน้าไหน
        LoginPage.routeName :(context) => const LoginPage(),
        HomePage.routeName : (context) => const HomePage(),
        FoodPage.routeName : (context) => const FoodPage(),
        ProfilePage.routeName : (context) => const ProfilePage(),
        FoodListPage.routeName: (context) => const FoodListPage(),
        OrderPage.routeName: (context) => const OrderPage(),
        FoodDetails.routeName: (context) => const FoodDetails(),
      },
      initialRoute: LoginPage.routeName, //กำหนด widget หลัก / ระบุื่อ route
    );
  }
}

