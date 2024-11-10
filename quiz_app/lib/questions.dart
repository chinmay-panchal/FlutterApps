import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
// import 'package:quiz_app/blueprints/quiz_questions.dart';
import 'package:quiz_app/data/all_questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void questionChange(String selectedAnswer) {
    setState(() {
      widget.onSelectAnswer(selectedAnswer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.nunito(
                color: const Color.fromARGB(255, 191, 255, 201),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  answertext: answer,
                  onTap: () {
                    questionChange(answer);
                  });
            }), 
          ],
        ),
      ),
    );
  }
}

// the mapping is the replacement for this four lines
// AnswerButton(answertext: currentQuestion.answers[0], onTap: () {}),
// AnswerButton(answertext: currentQuestion.answers[1], onTap: () {}),
// AnswerButton(answertext: currentQuestion.answers[2], onTap: () {}),
// AnswerButton(answertext: currentQuestion.answers[3], onTap: () {}),