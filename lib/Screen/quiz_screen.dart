import 'package:flutter/material.dart';
import 'package:utslab5pemob/Widgets/answer_bar.dart';

import '../Models/quiz.dart';
import '../Data/quiz_dummy_data.dart';
import '../Provider/app_state_provider.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

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

  void quizFinished(BuildContext context, int finalScore) {
    final appState = Provider.of<AppStateProvider>(context, listen: false);
    appState.saveHighscore(finalScore);
  }

  void _answerQuestion(int selectedIndex) {
    if (_quizFinished) {
      return;
    }

    bool isCorrect = selectedIndex == currentQuiz.correctAnswerIndex;
    if (isCorrect) {
      _score++;
      print('Jawaban Benar');
    } else {
      quizFinished(context, _score);
      _quizFinished = true;
      print('Jawaban slah');
    }

    setState(() {
      if (_currentQuestionIndex < quizList.length - 1) {
        _currentQuestionIndex++;
      } else {
        quizFinished(context, _score);
        _quizFinished = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_quizFinished) {
      return Consumer<AppStateProvider>(
        builder: (context, appState, child) {
          final currentUsername = appState.currentUsername;
          final currentHighscore = appState.currentHighscore;

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
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 480,
                    height: 150,
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/PapanKayuShort.png'),
                        fit: BoxFit.none,
                      ),
                      color: Colors.green,
                    ),
                    child: Container(
                      height: 500,
                      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/kertasKecil.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(flex: 1,child: SizedBox.shrink(),),
                          Expanded(flex: 1,child: Text('username: $currentUsername', style: TextStyle(fontFamily: 'BaskervvilleSC', fontSize: 17,),)),
                          Expanded(flex: 1,child: Text('score : $_score', style: TextStyle(fontFamily: 'BaskervvilleSC', fontSize: 17,),),),
                          Expanded(flex: 1,child: Text('Highscore: $currentHighscore', style: TextStyle(fontFamily: 'BaskervvilleSC', fontSize: 17,),)),
                          Expanded(flex: 1,child: SizedBox.shrink(),),
                          Expanded(flex: 1,
                            child: InkWell(
                              onTap: () {context.pop();},
                              child: Container(
                                alignment: AlignmentGeometry.center,
                                width: 250,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/NavbarKayu.png'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Text('Back to Home', style: TextStyle(color: Colors.white, fontFamily: 'LuckiestGuy')),
                              ),
                            ),
                          ),
                          Expanded(flex: 1,child: SizedBox.shrink(),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Color(0xffe8b882),
          );
        },
      );


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
                        style: TextStyle(fontFamily: 'BaskervvilleSC', fontSize: 25,),
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