import 'package:flutter/material.dart';

class quizButton extends StatelessWidget {
  final String option;
  final Color answerColor;
  final VoidCallback answerTap;
  final Icon icon;
  final String emoji;

  quizButton(
      {required this.option,
      required this.answerColor,
      required this.answerTap,
      required this.icon,
      required this.emoji});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: answerTap,
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
              //color: Colors.deepPurpleAccent[200],
              borderRadius: BorderRadius.circular(16)),
          child: Center(
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
                          emoji,
                          style: TextStyle(fontSize: 24),
                        )),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        option,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                        height: 25,
                        width: 25,
                        child: icon,
                        decoration: BoxDecoration(
                          //color: Colors.deepPurpleAccent[200],
                          borderRadius: BorderRadius.circular(16),
                          color: answerColor,

                          border: Border.all(width: 2, color: Colors.black),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
