import 'package:flutter/material.dart';
import 'package:flutter_food/pages/home/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var pin = '123456';
  var input = '';

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            /*stops: [ ไล่สี
              0.0,
              0.95,
              1.0,
            ],*/
            colors: [
              Colors.white,
              //Color(0xFFD8D8D8),
              //Color(0xFFAAAAAA),
              Theme.of(context).colorScheme.background.withOpacity(0.5),
              //Theme.of(context).colorScheme.background.withOpacity(0.6),
              //Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock_outline,
                          size: 100.0,
                        ),
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(height: 4.0),
                        Text('Enter PIN to login'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < input.length; i++)
                          Container(
                            margin: EdgeInsets.all(4.0),
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                shape: BoxShape.circle),
                          ),
                        for (var i = input.length; i < 6; i++)
                          Container(
                            margin: EdgeInsets.all(4.0),
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                //color: Colors.deepPurple,
                child: Column(
                    children: [
                  [1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 9],
                  [-2, 0, -1],
                ].map((row) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map((item) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LoginButton(
                              number: item, onClick: _handleClickButton),
                        );
                      }).toList());
                }).toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleClickButton(int number) {
    setState(() {
      if (number == -1) {
        if (input.length > 0) input = input.substring(0, input.length - 1);
      } else {
        input = input + '$number'; // '$input$num'
      }
    });
    setState(() {
      if (input.length == pin.length) {
        _test(input);
      }
    });
  }

  Future<void> _test(String input) async {
    var url = Uri.parse('https://cpsu-test-api.herokuapp.com/login');
    var response = await http.post(url, body: {'pin': input});
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      String status = jsonBody['status'];
      String? message = jsonBody['message'];
      bool data = jsonBody['data'];

      print('STATUS: $status');
      print('MESSAGE: $message');
      print('DATA: $data');

      if (data == true) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      } else {
        _showMaterialDialog('ERROR', 'Invalid PIN. Please try again');
        input = '';
      }
    }
  }
}

class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClick;

  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: number == -2
          ? null
          : () {
              onClick(number);
            },
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: number == -2
            ? null
            : BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.0,
                ),
              ),
        child: Center(
          child: number >= 0
              ? Text('$number', style: Theme.of(context).textTheme.headline6)
              : (number == -1
                  ? Icon(
                      Icons.backspace_outlined,
                      size: 28.0,
                    )
                  : SizedBox.shrink()),
        ),
      ),
    );
  }
}
