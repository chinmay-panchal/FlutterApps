import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Startscreen extends StatelessWidget {
  const Startscreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
              'assets/images/quiz-logo.png',
              width: 200,
              color: const Color.fromARGB(153, 255, 255, 255),
            ),
          // Opacity(
          //   opacity: 0.7,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 200,
          //   ),
          // ),
          const SizedBox(height: 40,),
          Text('Learn Flutter in fun Way!', 
            style: GoogleFonts.nunito(
              color: const Color.fromARGB(255, 225, 255, 240),
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 20,),
          OutlinedButton.icon(
            onPressed: switchScreen,
            // OR alternatively
            // onPressed: () {
            //   switchScreen();
            // }, 
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white, 
              side: const BorderSide(color: Color.fromARGB(80, 255, 255, 255)),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // No rounding
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
