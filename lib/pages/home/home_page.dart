import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/food_page.dart';
import 'package:flutter_food/pages/home/profile_page.dart';
import 'package:flutter_food/pages/login/login_page.dart';

class Homepage extends StatefulWidget {
  static const routeName =
      '/home'; //การดึงค่าคงที่มาใช้และให้เป็น compile time จะทำการแทนที่ routeName ด้วย /home เวลาแก้จะได้แก้ที่เดียว
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _subPageIndex = 2;
  //var _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
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
            ListTile(
                title: _buildDrawerItem(Icon(Icons.fastfood), 'FOOD'),
                onTap: (){
                  Navigator.pushNamed(context, FoodPage.routeName);
                }
            ),
            ListTile(
                title: _buildDrawerItem(Icon(Icons.person), 'PROFILE'),
                onTap: () {
                  Navigator.pushNamed(context, ProfilePage.routeName);
                }
                ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'HOME PAGE',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
  Row _buildDrawerItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(width: 8.0),
        Text(title),
      ],
    );
  }
  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
    });
    Navigator.of(context).pop();
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


}
