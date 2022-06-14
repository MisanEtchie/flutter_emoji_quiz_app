import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../models/questions.dart';
import 'answers.dart';
import 'button.dart';

class QuizBody extends StatefulWidget {
  const QuizBody({
    //required this.question,
    Key? key,
  }) : super(key: key);

  //final Question question;

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  var _questionIndex = 0;
  var totalScore = 0;
  bool isClicked = false;
  bool endofQuiz = false;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      totalScore = 0;
      endofQuiz = false;
      isClicked = false;
    });
  }

  void questionAnswered(bool answerScore) async {
    setState(() {
      isClicked = true;
      print("object");
      if (answerScore) {
        totalScore++;
        print(totalScore);
      }
      if ((_questionIndex + 1) == newquestions.length) {
        endofQuiz = true;
        highscore();
      }
      Future.delayed(const Duration(milliseconds: 500), () {
        rascal();
      });
    });
  }

  void rascal() {
    setState(() {
      if ((_questionIndex + 1) == newquestions.length) {
        return;
      }
      _questionIndex++;

      isClicked = false;
      if ((_questionIndex + 1) == newquestions.length) {
        endofQuiz = true;

        //resetQuiz();
      }
    });
  }

  void highscore() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            backgroundColor: Colors.blue,
            insetPadding: EdgeInsets.all(24),
            contentPadding: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        Text(
                          "Congratulations!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Score:",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          totalScore.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 70.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          onTap: () {
                            resetQuiz();
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius: BorderRadius.circular(16)),
                            child: Center(
                                child: Text(
                              "Restart Quiz",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ))),
            ],
          );
        });
  }

  /*void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < newquestions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
                children: [
                  TextSpan(
                    text: 'Question ${_questionIndex + 1}/',
                    style: TextStyle(fontSize: 26),
                  ),
                  TextSpan(
                    text: '${newquestions.length}',
                  )
                ],
              ),
            ),
            SizedBox(height: 4),
            Divider(color: Colors.grey[700], thickness: 1),
            Spacer(
              flex: 2,
            ),
            Container(
              height: 170,
              child: Column(children: [
                Center(
                  child: Text(
                    "${newquestions[_questionIndex]['emoji']}",
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
                Text(
                  "${newquestions[_questionIndex]['question']}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ]),
            ),
            Spacer(
              flex: 3,
            ),
            ...(newquestions[_questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map((answer) => GestureDetector(
                      child: quizButton(
                        emoji: "${answer['emoji']}",
                        option: "${answer['answerText']}",
                        answerColor: isClicked
                            ? answer["score"] == true
                                ? Colors.deepPurpleAccent
                                : Colors.transparent
                            : Colors.transparent,
                        icon: isClicked
                            ? answer["score"] == true
                                ? Icon(
                                    FontAwesomeIcons.check,
                                    color: Colors.white,
                                    size: 15,
                                  )
                                : Icon(
                                    FontAwesomeIcons.xmark,
                                    color: Colors.transparent,
                                    size: 15,
                                  )
                            : Icon(
                                Icons.check,
                                color: Colors.transparent,
                              ),
                        answerTap: () {
                          setState(() {
                            if (isClicked) {
                              return;
                            }
                            questionAnswered(
                                answer['score'] == true ? true : false);
                          });
                          //questionAnswered(false);
                        },
                      ),
                    )),
            SizedBox(
              height: 24,
            ),
            /*GestureDetector(
              onTap: () {
                rascal();
              },
              child: Container(
                height: 50,
                width: endofQuiz ? 150 : 120,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                    child: Text(
                  endofQuiz ? "Restart Quiz" : "Next",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),*/
            Spacer(
              flex: 3,
            ),

            /*Expanded(
              child: ListView.builder(
                  itemCount: newquestions[_questionIndex].length,
                  itemBuilder: (context, index) {
                    return Answer(
                        "${newquestions[_questionIndex]['answers'] ?? [
                              'text'
                            ][index]}");
                  }),
            )
            ...(newquestions[_questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => _answerQuestion(answer[]));
        }).toList()
            Spacer(
              flex: 3,
            ),
            QuizButton(
                emoji: widget.question.e1,
                option: widget.question.q1,
                ans: widget.question.a1),
            QuizButton(
                emoji: widget.question.e2,
                option: widget.question.q2,
                ans: widget.question.a2),
            QuizButton(
                emoji: widget.question.e3,
                option: widget.question.q3,
                ans: widget.question.a3),
            Spacer(
              flex: 3,
            )*/
          ],
        ),
      ),
    );
  }
}
