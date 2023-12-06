// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizlogic.dart';

void main() {
  runApp(const QuizApp());
}

QuizLogic quizlogic = QuizLogic();

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: QuizPage(),
        )),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctanswer = quizlogic.getQuestionAnswer();

    setState(() {
      if (quizlogic.isFinished() == true) {
        _onBasicAlertPressed(context);
        quizlogic.reset();
        scoreKeeper = [];
      } else {
        if (correctanswer == userPickedAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }

        quizlogic.netxtquestion();
      }
    });
  }

  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "Finished the Quiz",
      desc: "Congrats",
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizlogic.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("true")),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("false")),
        )),
        Row(children: scoreKeeper)
      ],
    );
  }
} //the root of your application.
