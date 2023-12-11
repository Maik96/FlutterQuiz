import 'package:flutter/material.dart';
import 'package:quizapp/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
        }

        quizlogic.netxtquestion();
      }
    });
  }

  _onBasicAlertPressed(context) {
    Alert(
      context: context,
      title: "Congratulations",
      desc: "You have finished the Flutter Quiz",
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
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizlogic.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 25.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w700),
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
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.black,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.green, width: 5))),
              child: const Text(
                "True",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              )),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
              onPressed: () {
                checkAnswer(false);
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.black,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.red, width: 5))),
              child: const Text(
                "False",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
              )),
        )),
        Row(children: scoreKeeper)
      ],
    );
  }
} //the root of your application.
