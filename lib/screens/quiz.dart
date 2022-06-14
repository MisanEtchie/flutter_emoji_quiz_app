import 'package:emoji_quiz_app/models/questions.dart';
import 'package:emoji_quiz_app/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';

import '../widgets/quizbody.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/quizapp1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Scaffold(
                backgroundColor: Colors.transparent,

                //backgroundColor: Colors.blueGrey[900],
                body: SafeArea(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(height: 16),
                      QuizBody(),
                    ]))),
          ],
        ));
  }
}
