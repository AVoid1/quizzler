import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionsBank = [
    Question(
        q: 'The computer will carry out the instructions that follow the symbol',
        a: false),
    Question(q: 'A program must have a main function.', a: true),
    Question(
        q: 'There is no limit on the size of the numbers that can be stored in the int data type.',
        a: false),
    Question(
        q: 'Super classes are also called Parent classes/Base classes.',
        a: true),
    Question(
        q: 'It is not possible to achieve inheritance of structures in c++?',
        a: false),
    Question(
        q: 'Sub classes may also be called Child classes/Derived classes.',
        a: true),
    Question(
        q: 'An identifier must start with a letter or an underscore.', a: true),
    Question(q: '76.45e-2 is a valid value for a float data type.', a: true),
    Question(
        q: 'A C++ statement cannot extend over more than one line.', a: false),
    Question(q: 'All data types take up the same amount of storage.', a: false),
    Question(q: '>> is used for output.', a: false),
    Question(
        q: ' In C++ addition is always evaluated before subtraction.',
        a: false),
  ];

  bool isFinished() {
    if (_questionNumber >= _questionsBank.length - 1) {
      print('true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  void nextQuestion() {
    if (_questionNumber < _questionsBank.length - 1) {
      _questionNumber++;
    }
  }

  String gotQuestionText() {
    return _questionsBank[_questionNumber].questionText;
  }

  bool gotCorrectAnswer() {
    return _questionsBank[_questionNumber].questionAnswer;
  }
}
