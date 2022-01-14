import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          flex: 5,
          child: Center(
            child: Text(
              'This is where all the question will show',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {},
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
              onPressed: () {},
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
