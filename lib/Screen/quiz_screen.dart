import 'package:flutter/material.dart';
import 'package:utslab5pemob/Widgets/answer_bar.dart';

import '../Models/quiz.dart';
import '../Data/quiz_dummy_data.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {


  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizFinished = false;

  Quiz get currentQuiz => quizList[_currentQuestionIndex];

  void _answerQuestion(int selectedIndex) {
    if (_quizFinished) {
      _saveHighscore(_score);
      return;
    }

    bool isCorrect = selectedIndex == currentQuiz.correctAnswerIndex;
    if (isCorrect) {
      _score++;
      print('Jawaban Benar');
    } else {
      _quizFinished = true;
      print('Jawaban slah');
    }
    setState(() {
      if (_currentQuestionIndex < quizList.length - 1) {
        _currentQuestionIndex++;
      } else {
        _quizFinished = true;
      }
    });
  }

  void _saveHighscore(int score) async {

  }

  @override
  Widget build(BuildContext context) {
    if (_quizFinished) {
      return const Center(child: Text('Kuis Selesai!'));
    }

    return Scaffold(
      body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/ProfileBG.png'),
                    fit: BoxFit.fitHeight,
                  ),
                  color: Colors.red,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child:
                    Container(
                      alignment: AlignmentGeometry.center,
                      width: 380,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/kertasPipihPol.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text(
                        currentQuiz.questionText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/PapanKayuShort.png'),
                    fit: BoxFit.none,
                  ),
                  color: Colors.green,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _answerQuestion(0);
                      },
                      child: AnswerBar(answerOptionText: currentQuiz.options[0],),
                    ),
                    InkWell(
                      onTap: () {
                        _answerQuestion(1);
                      },
                      child: AnswerBar(answerOptionText: currentQuiz.options[1],),
                    ),
                    InkWell(
                      onTap: () {
                        _answerQuestion(2);
                      },
                      child: AnswerBar(answerOptionText: currentQuiz.options[2],),
                    ),
                    InkWell(
                      onTap: () {
                        _answerQuestion(3);
                      },
                      child: AnswerBar(answerOptionText: currentQuiz.options[3],),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      backgroundColor: Color(0xffe8b882),
    );
  }
}