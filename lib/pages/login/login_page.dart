import 'package:flutter/material.dart';
import 'package:flutter_food/pages/login/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var input = '';
  var add = 0;

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
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var i = 0; i < input.length; i++)
                            Icon(
                              Icons.circle,
                              size: 30.0,
                              color: Colors.blue,
                            ),
                          for (var i = 0; i < 6-input.length; i++)
                            Icon(
                              Icons.circle_outlined,
                              size: 30.0,
                              color: Colors.blue,
                            )
                        ],
                      ),
                    ],
                  ),
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
    add++;
    print("pin $number");
    print(input.length);
    // input.length -- ถ้าครบเท่ากับ 123456 มั้ย ถ้าใช่ show ถูก ไม่ใช่ show ผิด แล้ว push
    setState(() {
      if (number == -1) {
        if (input.length > 0) input = input.substring(0, input.length - 1);
      } else {
        input = input + '$number'; // '$input$num'
      }
    });
    setState(() {
      if (input.length == 6) {
        if (input == '123456') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        } else {
          _showMaterialDialog('ERROR', 'Invalid PIN. Please try again');
          input = '';
        }
      }
    });
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
                shape: BoxShape.circle, border: Border.all(width: 2.0)),
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