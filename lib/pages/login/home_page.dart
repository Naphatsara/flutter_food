import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FLUTTER FOOD"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('THIS IS A HOME PAGE',style:Theme.of(context).textTheme.headline1,)),
        ],
      ),
    );
  }
}
