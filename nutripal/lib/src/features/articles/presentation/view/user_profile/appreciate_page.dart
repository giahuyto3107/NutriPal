import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class AppreaciatePage extends StatefulWidget {
  const AppreaciatePage({super.key});

  @override
  State<AppreaciatePage> createState() => _AppreaciatePageState();
}

class _AppreaciatePageState extends State<AppreaciatePage> {
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();
    confettiController = ConfettiController(duration: Duration(seconds: 10));
    confettiController.play();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ConfettiWidget(
            confettiController: confettiController,
            shouldLoop: true,
            blastDirectionality: BlastDirectionality.directional,
            blastDirection: pi / 2, // downward
            emissionFrequency: 0.06,
            numberOfParticles: 8,
            gravity: 0.18,
             minimumSize: const Size(8, 8), // make particles bigger
  maximumSize: const Size(16, 16),
            colors: [
              Colors.yellow,
              Colors.green,
              Colors.pink,
              Colors.blue,
              Colors.orange,
            ],
            createParticlePath: (size) {
    return Path()..addOval(Rect.fromCircle(center: Offset(0, 0), radius: size.width / 2));
  },
          ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Color(0xffdd996a),
                    ),
                  Text(
                    " All done!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  "Thank you for trusting us",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 33
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  "We promise to always keep your personal information private and secure.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),
              )
            ],
          ),
        ),
        
      ]
    );
  }
}