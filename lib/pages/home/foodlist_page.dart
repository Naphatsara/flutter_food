import 'package:flutter/material.dart';
import 'package:flutter_food/models/food_details.dart';
import 'package:flutter_food/models/food_item.dart';

class FoodListPage extends StatefulWidget {
  static const routeName = '/foodlist';

  const FoodListPage({Key? key}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  //final items = List<String>.generate(10000, (index) => "Item $index"); //functional programming
  var items = [
    FoodItem(
      id: 1,
      name: "ข้าวไข่เจียว",
      price: 25,
      image: 'kao_kai_jeaw.jpg',
    ),
    FoodItem(
      id: 2,
      name: "ข้าวหมูแดง",
      price: 30,
      image: 'kao_moo_dang.jpg',
    ),FoodItem(
      id: 3,
      name: "ข้าวมันไก่",
      price: 30,
      image: 'kao_mun_kai.jpg',
    ),FoodItem(
      id: 4,
      name: "ข้าวหน้าเป็ด",
      price: 40,
      image: 'kao_na_ped.jpg',
    ),FoodItem(
      id: 5,
      name: "ข้าวผัด",
      price: 30,
      image: 'kao_pad.jpg',
    ),FoodItem(
      id: 6,
      name: "ผัดซีอิ๊ว",
      price: 30,
      image: 'pad_sie_eew.jpg',
    ),FoodItem(
      id: 7,
      name: "ผัดไทย",
      price: 35,
      image: 'pad_thai.jpg',
    ),FoodItem(
      id: 8,
      name: "ราดหน้า",
      price: 30,
      image: 'rad_na.jpg',
    ),FoodItem(
      id: 9,
      name: "ส้มตำไก่ย่าง",
      price: 80,
      image: 'som_tum_kai_yang.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          var item = items[index]; //FoodItem

          return Card(
            //margin bt บนล่าง
            margin: const EdgeInsets.all(8.0),
            //const เพื่อสร้าง EdgeInsets แค่ครั้งเดียวแทนที่จะ generate 1000 ครั้งตามจำนวน obj
            child: InkWell(  // เพื่อให้สามารถคลิกได้
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FoodDetails(),
                    // Pass the arguments as part of the RouteSettings. The
                    // DetailScreen reads the arguments from these settings.
                    settings: RouteSettings(
                      arguments: items[index],
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/${item.image}',
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(fontSize: 25.0),
                        ),Row(
                          children: [
                            Text(
                              item.price.toString(),
                              style: TextStyle(fontSize: 15.0),
                            ),Text(
                              " บาท",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
