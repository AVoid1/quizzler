import 'package:flutter/material.dart';
import 'dart:math';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: quizllerApp(),
        ),
      ),
    ),
  ));
}

class quizllerApp extends StatefulWidget {
  const quizllerApp({Key? key}) : super(key: key);

  @override
  _quizllerAppState createState() => _quizllerAppState();
}

class _quizllerAppState extends State<quizllerApp> {
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool checkAnswer = quizBrain.gotCorrectAnswer();
    setState(
      () {
        if (quizBrain.isFinished() == true) {
          Alert(
                  context: context,
                  title: 'FINISHED',
                  desc: 'You\'ve completed the test')
              .show();
          quizBrain.reset();
          scoreKeeper = [];
        } else {
          if (checkAnswer == userPickedAnswer) {
            scoreKeeper.add(
              const Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          } else {
            scoreKeeper.add(
              const Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          }

          quizBrain.nextQuestion();
        }
      },
    );
  }

  // List<String> questions = [
  //   'The computer will carry out the instructions that follow the symbol',
  //   'A program must have a main function.',
  //   'There is no limit on the size of the numbers that can be stored in the int data type.',
  // ];

  // List<bool> answers = [false, true, false];

  // Question q1 = Question(
  //     q: 'The computer will carry out the instructions that follow the symbol',
  //     a: false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.gotQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
