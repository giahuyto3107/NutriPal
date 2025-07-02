import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AskForNotificationPage extends StatelessWidget {
  const AskForNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/illustrative_image.png',
          height: 200),
        SizedBox(height: 20),
        Text(
          "Reach your goals with notifications",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
        ),

        SizedBox(height: 20),
        SvgPicture.asset('assets/images/notification_image.svg'),
        SizedBox(height: 30),
        Text(
          "You can turn off any of the reminders at any time in the settings. We don't spam you.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 17
          ),
        )
      ],
    );
  }
}