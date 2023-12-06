import 'package:quizapp/question.dart';

class QuizLogic {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
        questiontext: 'You can lead a cow down stairs but not up stairs.',
        questionAnswer: false),
    Question(
        questiontext:
            'Approximately  one quarter of human bones are in the feet.',
        questionAnswer: true),
    Question(questiontext: 'A slug\'s blood is green.', questionAnswer: true)
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
