import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// an object for the class QuizBrain
QuizBrian quizBrian = QuizBrian();
// a function for Sizedbox10
SizedBox sizedBox10() {
  return SizedBox(
    height: 10,
  );
}

// a function for Sizedbox5
SizedBox sizedBox5() {
  return SizedBox(
    height: 5,
  );
}

class Hml extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color of the page
      backgroundColor: Colors.orange[200],
      body: SafeArea(
        child: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //an empty list that expects colums
  List<Column> answershower = [];
  //a varaible to type cast int to string
  String holder;

  //function tto check option sleceted by the user

  void checkAnswer(int answerselected) {
    //assigning a variable to the correct answer
    int answer = quizBrian.correctAnswer[quizBrian.questionNumber];
    //checking if the option selceted by the user matches the correct answer
    if (answerselected == answer) {
      //adding to the list of colums
      setState(() {
        answershower.add(
          Column(
            children: [
              //explanintion of the correct answer
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 390),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  ),
                  child: Row(
                    children: [
                      //an icon to show user is correct
                      Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 30.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      //explanantion on the correct answer
                      Expanded(
                        child: Text(
                          // the index of the explantion should be the same ass the current question
                          quizBrian.explanationc[quizBrian.questionNumber],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            letterSpacing: 3,
                            // fontFamily: 'KronaOne',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              sizedBox10(),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 390),
                child: ElevatedButton(
                  onPressed: () {
                    if (quizBrian.isFinished() == true) {
                      //incrementing the final score
                      quizBrian.finalScore++;
                      String af = quizBrian.finalScore.toString();
                      Alert(
                        context: context,
                        title: "End of the quiz",
                        desc: "Final Score: $af",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Try Again",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/SecondRoute'),
                            width: 120,
                          )
                        ],
                      ).show();
                      //reset the quiz
                      quizBrian.restQuiz();
                    } else {
                      setState(() {
                        //incrementing answeredcorrectly
                        quizBrian.answeredcorrectly++;
                        //incrementing the final score
                        quizBrian.finalScore++;
                        //going to the next question
                        quizBrian.nextQuestion();
                        //making the list of colums empty
                        answershower = [];
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  ),
                  child: Text(
                    "Next Question",
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
        );
      });
    } // if option selected is wrong
    else {
      setState(() {
        answershower.add(
          Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 390),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 30.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          quizBrian.explanationw[quizBrian.questionNumber],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            letterSpacing: 3,
                            // fontFamily: 'KronaOne',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              sizedBox10(),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 390),
                child: ElevatedButton(
                  onPressed: () {
                    //checking to see if questions are finished
                    if (quizBrian.isFinished() == true) {
                      String af = quizBrian.finalScore.toString();
                      Alert(
                        context: context,
                        title: "End of the quiz",
                        desc: "Final Score: $af",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Try Again",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/SecondRoute'),
                            width: 120,
                          )
                        ],
                      ).show();
                      //reset the quiz
                      quizBrian.restQuiz();
                    } else {
                      setState(() {
                        //incrementing answeredwrongly
                        quizBrian.answeredwrongly++;
                        //going to the next question
                        quizBrian.nextQuestion();
                        answershower = [];
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  ),
                  child: Text(
                    "Next Question",
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
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //box for questions
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 400, height: 200),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(primary: Colors.white),
              child: Text(
                //showing the questions
                quizBrian.showQuestion(),

                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing: 3,
                    // fontFamily: 'KronaOne',
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
        Column(
          children: [
            //first option
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300),
              child: ElevatedButton(
                onPressed: () {
                  //calling the function to check if the option picked is correct
                  checkAnswer(
                    quizBrian.showChoices(0),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                ),
                child: Text(
                  //changing the int values for the answrs to strings
                  holder = quizBrian.showChoices(0).toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 3,
                      // fontFamily: 'KronaOne',
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            sizedBox5(),
            //second option
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300),
              child: ElevatedButton(
                onPressed: () {
                  checkAnswer(
                    quizBrian.showChoices(1),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                ),
                child: Text(
                  holder = quizBrian.showChoices(1).toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 3,
                      // fontFamily: 'KronaOne',
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            sizedBox5(),
            //third option
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300),
              child: ElevatedButton(
                onPressed: () {
                  checkAnswer(
                    quizBrian.showChoices(2),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                ),
                child: Text(
                  holder = quizBrian.showChoices(2).toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 3,
                      // fontFamily: 'KronaOne',
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            sizedBox5(),
            //fourth option
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300),
              child: ElevatedButton(
                onPressed: () {
                  checkAnswer(
                    quizBrian.showChoices(3),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                ),
                child: Text(
                  holder = quizBrian.showChoices(3).toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      letterSpacing: 3,
                      // fontFamily: 'KronaOne',
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            sizedBox5(),
            //displaying the list of columns which hold the explanantions
            Row(
              children: answershower,
            )
          ],
        )
      ],
    );
  }
}
