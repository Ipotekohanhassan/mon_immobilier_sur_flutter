import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Importer google_fonts
import 'splash_screen.dart'; // Assure-toi que le fichier splash_screen.dart est bien importé
import 'main_screen.dart'; // Assurez-vous d'importer MainScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Enlever le label de debug
      title: 'Mon Immobilier Sûr',
      theme: ThemeData(
        primaryColor: const Color(0xFF607D8B), // Couleur gris foncé
        scaffoldBackgroundColor:
            const Color(0xFFF5F5F5), // Couleur gris clair pour l'arrière-plan
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(
              0xFF607D8B), // Assurez-vous que cette couleur soit utilisée partout
        ),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context)
              .textTheme, // Applique la police Roboto à tout le texte
        ),
      ),
      home: const SplashScreen(), // L'écran de démarrage
      routes: {
        '/MainScreen': (context) =>
            const MainScreen(), // Ajouter la route vers MainScreen
      },
    );
  }
}
