import 'package:flutter/material.dart';
import 'dart:math';
import 'package:quizzler/question.dart';

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

  // List<String> questions = [
  //   'The computer will carry out the instructions that follow the symbol',
  //   'A program must have a main function.',
  //   'There is no limit on the size of the numbers that can be stored in the int data type.',
  // ];

  // List<bool> answers = [false, true, false];

  // Question q1 = Question(
  //     q: 'The computer will carry out the instructions that follow the symbol',
  //     a: false);

  List<Question> questionsBank = [
    Question(
        q: 'The computer will carry out the instructions that follow the symbol',
        a: false),
    Question(q: 'A program must have a main function.', a: true),
    Question(
        q: 'There is no limit on the size of the numbers that can be stored in the int data type.',
        a: false)
  ];

  int questionNumber = 0;

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
              questionsBank[questionNumber].questionText,
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
                bool correctAnswer =
                    questionsBank[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  scoreKeeper.add(
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                  print('user got it right');
                } else {
                  scoreKeeper.add(
                    const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                  print('user got it wrong');
                }
                setState(
                  () {
                    setState(() {
                      questionNumber++;
                    });
                  },
                );
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
                bool correctAnswer =
                    questionsBank[questionNumber].questionAnswer;
                if (correctAnswer == false) {
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
                setState(() {
                  setState(() {
                    questionNumber++;
                  });
                });
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
