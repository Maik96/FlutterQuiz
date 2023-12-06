// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizapp/question.dart';

void main() {
  runApp(const QuizApp());
}

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

// This widget is
//
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  List<Question> questionBank = [
    Question(
        questiontext: 'You can lead a cow down stairs but not up stairs.',
        questionAnswer: false),
    Question(
        questiontext:
            'Approximately  one quarter of human bones are in the feet.',
        questionAnswer: true),
    Question(questiontext: 'A slug\'s blood is green.', questionAnswer: true)
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
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                questionBank[questionNumber].questiontext,
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
                setState(() {
                  bool correctanswer =
                      questionBank[questionNumber].questionAnswer;

                  if (correctanswer == true) {}

                  questionNumber++;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("true")),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  bool correctanswer =
                      questionBank[questionNumber].questionAnswer;

                  if (correctanswer == false) {}

                  questionNumber++;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("false")),
        )),
        Row(children: scoreKeeper)
      ],
    );
  }
} //the root of your application.
