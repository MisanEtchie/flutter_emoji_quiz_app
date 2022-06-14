import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final String emoji;
  final Color color1;
  final Color color2;
  const CategoryButton({
    Key? key,
    required this.title,
    required this.emoji,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              //Colors.pinkAccent,
              color1,
              color2
            ]),
            borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                emoji,
                style: TextStyle(
                  fontSize: 70,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Expanded(
                  child: SizedBox(
                height: double.infinity,
              )),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white),
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
