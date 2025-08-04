import 'dart:math' as math;
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class AppreaciatePage extends StatefulWidget {
  final int currentStep;
  final ConfettiController confettiController;

  const AppreaciatePage({super.key, required this.currentStep, required this.confettiController});

  @override
  State<AppreaciatePage> createState() => _AppreaciatePageState();
}

class _AppreaciatePageState extends State<AppreaciatePage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin { // Add TickerProviderStateMixin
  
  late AnimationController animationController; // Declare as late

  @override
  bool get wantKeepAlive => true;

  @override
Widget build(BuildContext context) {
  super.build(context);
  return Stack(
    children: [
      // 🌟 Appreciation Message Content
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Color(0xffdd996a)),
              SizedBox(width: 8),
              Text(
                " All done!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              "Thank you for trusting us",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 33,
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: Text(
              "We promise to always keep your personal information private and secure.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      
      // 🎉 Full-screen Confetti Overlay
      Align(
          alignment: Alignment.center, // Adjust as needed
          child: ConfettiWidget(
            confettiController: widget.confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            blastDirection: math.pi / 2, // 60° diagonal-right
            emissionFrequency: 0.08,
            numberOfParticles: 12,
            gravity: 0.018,
            minimumSize: Size(8, 8),
            maximumSize: Size(16, 16),
            colors: [
              Colors.yellow,
              Colors.green,
              Colors.pink,
              Colors.blue,
              Colors.orange,
            ],
            shouldLoop: true,
            
          ),
        ),
    ],
  );
  }
}