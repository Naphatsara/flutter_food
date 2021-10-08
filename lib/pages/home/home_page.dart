import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/food_page.dart';
import 'package:flutter_food/pages/home/profile_page.dart';


class HomePage extends StatefulWidget {
  static const routeName =
      '/home'; //การดึงค่าคงที่มาใช้และให้เป็น compile time จะทำการแทนที่ routeName ด้วย /home เวลาแก้จะได้แก้ที่เดียว
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedDrawerItemIndex = 0;

  final _pageDataList = [
    {
      'icon': Icons.fastfood,
      'title': 'Food',
      'page': FoodPage(),
    },
    {
      'icon': Icons.person,
      'title': 'Profile',
      'page': ProfilePage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDataList[_selectedDrawerItemIndex]['title'] as String),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amberAccent.shade200,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        child: Image.asset('assets/images/profile.jpg'),
                      )
                  ),
                  Text(
                    'Naphatsara Thorngsophon',
                    style: TextStyle(color: Colors.white,fontSize: 18.0),
                  ),Text(
                    'thorngsophon_n@silpakorn.edu',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            for (var item in _pageDataList)
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      color: item == _pageDataList[_selectedDrawerItemIndex]
                          ? Theme.of(context).accentColor
                          : null,
                    ),
                    SizedBox(width: 8.0),
                    Text(item['title'] as String),
                  ],
                ),
                onTap: () {
                  setState(() {
                    _selectedDrawerItemIndex =
                        _pageDataList.indexWhere((element) => item == element);
                  });
                  Navigator.of(context).pop();
                },
                selected: item == _pageDataList[_selectedDrawerItemIndex],
              ),
          ],
        ),
      ),
      body: Container(
        child: _pageDataList[_selectedDrawerItemIndex]['page'] as Widget,
      ),
    );
  }
}

  /*Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0:
        return ;
      case 1:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                    child: Image.asset('assets/images/profile.jpg'),
                  )
              ),
              SizedBox(height: 10.0),
              Text(
                'Naphatsara Thorngsophon',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 5.0),
              Text(
                'thorngsophon_n@silpakorn.edu',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
        ));
      default:
        return SizedBox.shrink();
    }
  }*/



