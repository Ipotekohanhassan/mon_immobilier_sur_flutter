import 'package:flutter/material.dart';
import 'package:mon_immobilier_sur/screens/welcom_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Créer l'AnimationController pour gérer le fade in/out
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Durée de l'animation
    )..repeat(reverse: true); // Répète l'animation avec un effet inverse

    // Animation de l'opacité entre 0 (invisible) et 1 (complètement visible)
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Redirection après 5 secondes vers la HomePage
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    // Libérer les ressources de l'AnimationController
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _animation, // Utilise l'animation de l'opacité
          child: Image.asset(
            'assets/images/loading_image.png',
            width: 350, // Augmenter la taille de l'image
            height: 350,
          ),
        ),
      ),
    );
  }
}
