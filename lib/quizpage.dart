import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[200, 200, 400];

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        title: Text(
          'CATEGORIES',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              letterSpacing: 5,
              fontFamily: 'KronaOne'),
        ),
        backgroundColor: Colors.orange[200],
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('images/14_generated.jpg'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/hml');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              "HOW MANY LEGS",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  letterSpacing: 3,
                                  // fontFamily: 'KronaOne',
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
