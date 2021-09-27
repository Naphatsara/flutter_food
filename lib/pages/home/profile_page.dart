import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/home_page.dart';
class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'),),
      //drawer: Homepage(),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
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
          ),),
    );
  }
}
