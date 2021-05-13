import 'package:flutter/material.dart';
import 'package:quiz_app_mine/hml.dart';
import 'quizpage.dart';

void main() {
  runApp(MaterialApp(title: 'Navigation Basics', home: FirstRoute(), routes: {
    "/FirstRoute": (context) => FirstRoute(),
    "/SecondRoute": (context) => SecondRoute(),
    "/hml": (context) => Hml()
  }));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: Image.asset('images/Brainstorming.jpg'),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'QUIZZLES',
                    style: TextStyle(
                        fontFamily: "KronaOne",
                        fontSize: 40.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 10),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/SecondRoute');
                    },
                    child: Text('Play Now'),
                    style: ElevatedButton.styleFrom(
                      // background color
                      primary: Colors.orange,
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      textStyle:
                          TextStyle(fontSize: 30, fontFamily: "KronaOne"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
