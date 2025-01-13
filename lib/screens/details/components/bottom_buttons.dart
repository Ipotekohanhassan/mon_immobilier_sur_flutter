import 'package:flutter/material.dart';
import 'package:mon_immobilier_sur/constants/constants.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: appPadding),
      child: Center(
        child: Container(
          width: size.width * 0.8, // Adjust width as needed
          height: 60,
          decoration: BoxDecoration(
            color: Colors.orangeAccent, // Orange-yellow background
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.orangeAccent.withOpacity(0.6),
                offset: const Offset(0, 10),
                blurRadius: 10,
              ),
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_today_rounded, // Calendar icon
                color: Colors.white,
              ),
              SizedBox(width: 10), // Space between icon and text
              Text(
                ' Prendre Rendez-vous',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
