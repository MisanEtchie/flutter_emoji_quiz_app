import 'package:emoji_quiz_app/models/questions.dart';
import 'package:emoji_quiz_app/widgets/answers.dart';
import 'package:flutter/material.dart';

class QuizButton extends StatefulWidget {
  final String option;
  final Color AnswerColor;
  final VoidCallback AnswerTab;

  final String emoji;
  //bool ans;

  QuizButton(
      {required this.option,
      required this.AnswerColor,
      required this.AnswerTab,
      required this.emoji});

  @override
  State<QuizButton> createState() => _QuizButtonState();
}

class _QuizButtonState extends State<QuizButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          widget.AnswerTab;
        },
        child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
                //color: Colors.deepPurpleAccent[200],
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          widget.emoji,
                          style: TextStyle(fontSize: 24),
                        )),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        widget.option,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          //color: Colors.deepPurpleAccent[200],
                          borderRadius: BorderRadius.circular(16),
                          color: widget.AnswerColor,

                          border: Border.all(width: 2, color: Colors.black),
                        ),
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
