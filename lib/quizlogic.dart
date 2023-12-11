import 'package:quizapp/question.dart';

class QuizLogic {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
        questiontext: 'Flutter uses Dart as its primary programming language',
        questionAnswer: true),
    Question(
        questiontext: 'Dart is a statically typed language only.',
        questionAnswer: false),
    Question(
        questiontext: 'Widgets in Flutter are immutable.',
        questionAnswer: true),
    Question(
        questiontext:
            'Flutter apps are compiled directly into native machine code',
        questionAnswer: true),
    Question(
        questiontext: 'Dart supports both single and multi-threading.',
        questionAnswer: true),
    Question(
        questiontext:
            'Hot Reload in Flutter allows developers to see instant changes without restarting the app.',
        questionAnswer: true),
    Question(
        questiontext: 'Flutter widgets can only have a single child.',
        questionAnswer: false),
    Question(
        questiontext:
            'Dart has built-in garbage collection for memory management.',
        questionAnswer: true),
    Question(
        questiontext:
            'Dart supports both object-oriented and functional programming paradigms.',
        questionAnswer: true),
    Question(
        questiontext:
            'Flutter provides platform-specific widgets for Android only.',
        questionAnswer: false),
    Question(
        questiontext: 'Dart is exclusively used for mobile app development.',
        questionAnswer: false),
    Question(
        questiontext:
            'Flutter\'s codebase can be reused to build web applications.',
        questionAnswer: true),
    Question(
        questiontext: 'Flutter apps can only be developed for iOS devices.',
        questionAnswer: false),
  ];

  void netxtquestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questiontext;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
