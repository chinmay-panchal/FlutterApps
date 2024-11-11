import 'package:flutter/material.dart'; // bluprints and behind the scenes
import 'package:quiz_app/Start_Screen.dart';
import 'package:quiz_app/data/all_questions.dart'; // question list of data
import 'package:quiz_app/questions.dart'; // questions screen
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? currentScreen;

  // @override
  // void initState() {
  //   super.initState();
  //   currentScreen = Startscreen(switchScreen);
  // }

  // OR

  List<String> selectedAnswers = [];
  var currentScreen = 'Start_Screen';

  void switchScreen() {
    setState(() {
      // currentScreen = const QuestionsScreen();
      currentScreen = 'Questions_Screen';
    });
  }

  void chooseAnswer(String answer) {
    // when all the questions are asked
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        currentScreen = 'Result_Screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      currentScreen = 'Questions_Screen';
    });
  }

  @override
  Widget build(context) {
    // final screenWidget = currentScreen == 'Start_Screen'
    //     ? Startscreen(switchScreen)
    //     : const QuestionsScreen();

    // OR

    Widget screenWidget = Startscreen(switchScreen);

    if (currentScreen == 'Questions_Screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (currentScreen == 'Result_Screen') {
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 50, 255, 156),
                Color.fromARGB(255, 0, 255, 132),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: currentScreen,
          child: screenWidget,
        ),
      ),
    );
  }
}
