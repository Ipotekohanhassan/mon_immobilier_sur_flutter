import 'package:flutter/material.dart';
import 'package:mon_immobilier_sur/auth/login_screen.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond avec un dégradé
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcom.jpg'), // Ajoutez l'image ici
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Carte en bas avec un message de bienvenue
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipPath(
                clipper: InverseWaveClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9), // Légère transparence
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Bienvenue!",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Explorez nos propriétés et prenez rendez-vous pour des visites.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            // Naviguer vers LoginScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.arrow_forward, color: Colors.white), // Icône ajoutée
                              SizedBox(width: 8),
                              Text(
                                "Commencer",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Clipper pour créer une forme de vague
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100); // Commence en bas à gauche
    path.quadraticBezierTo(
      size.width / 2, size.height, // Point de contrôle
      size.width, size.height - 100, // Fin de la vague
    );
    path.lineTo(size.width, 0); // Retour à l'angle supérieur droit
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// Clipper pour créer une forme incurvée inverse en haut de la carte
class InverseWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 50); // Commence en bas à gauche
    path.quadraticBezierTo(
      size.width / 2, 0, // Point de contrôle
      size.width, 50, // Fin de la courbe
    );
    path.lineTo(size.width, size.height); // Retour à l'angle inférieur droit
    path.lineTo(0, size.height); // Retour à l'angle inférieur gauche
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
