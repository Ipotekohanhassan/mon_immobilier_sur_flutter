import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mon_immobilier_sur/auth/change_password.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>(); // Clé pour le formulaire
  String? _phoneNumber; // Variable pour le numéro de téléphone
  bool _isOtpSent = false; // État pour vérifier si l'OTP a été envoyé
  final List<String> _otpCodes = List.filled(6, ""); // Liste pour les codes OTP

  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width; // Largeur de l'écran
    double screenHeight =
        MediaQuery.of(context).size.height; // Hauteur de l'écran

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05), // Marge horizontale
        child: Center(
          child: Form(
            key: _formKey, // Utilisation de la clé du formulaire
            child: ListView(
              shrinkWrap: true,
              children: [
                // Logo ou image de chargement
                Center(
                  child: Image.asset(
                    'images/loading_image.png',
                    height: screenHeight * 0.4, // Hauteur de l'image
                    fit: BoxFit.contain, // Ajustement de l'image
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                // Titre de la page de mot de passe oublié
                Text(
                  "Mot de passe oublié",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.08, // Taille de police
                    color: Colors.orange[700], // Couleur du texte
                    fontWeight: FontWeight.bold, // Poids de la police
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.04),

                // Afficher le champ pour le numéro de téléphone et le bouton si l'OTP n'est pas encore envoyé
                if (!_isOtpSent) ...[
                  // Champ pour le numéro de téléphone
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.orange[100], // Couleur de remplissage
                      labelText: 'Numéro de téléphone', // Texte de l'étiquette
                      labelStyle: GoogleFonts.poppins(
                          color: Colors.black), // Style de l'étiquette
                      prefixIcon: Icon(Icons.phone,
                          color: Colors.orange[700]), // Icône de préfixe
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // Arrondi des bords
                      ),
                    ),
                    keyboardType: TextInputType.phone, // Type de clavier
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer votre numéro de téléphone'; // Validation
                      }
                      return null;
                    },
                    onSaved: (value) =>
                        _phoneNumber = value, // Sauvegarde du numéro
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Bouton pour envoyer l'OTP
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Validation du formulaire
                        _formKey.currentState!.save(); // Sauvegarde des valeurs

                        // Logique pour envoyer l'OTP (simulée ici)
                        setState(() {
                          _isOtpSent = true; // Mettre à jour l'état
                        });

                        // Afficher un message de confirmation
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('OTP envoyé au numéro: $_phoneNumber')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.orange[700], // Couleur de fond du bouton
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02), // Marge verticale
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // Arrondi des bords
                      ),
                    ),
                    child: Text(
                      'Envoyer OTP',
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.045,
                        color: Colors.white,
                      ), // Style du texte
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],

                // Si l'OTP a été envoyé, afficher les champs OTP
                if (_isOtpSent) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: screenWidth * 0.13, // Largeur pour chaque case
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                Colors.orange[100], // Couleur de remplissage
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Arrondi des bords
                            ),
                            counterText: ""
                          ),
                          keyboardType: TextInputType.number, // Type de clavier
                          textAlign: TextAlign.center, // Centrer le texte
                          maxLength: 1, // Limiter à un seul caractère
                          
                          onChanged: (value) {
                            if (value.length == 1) {
                              _otpCodes[index] =
                                  value; // Sauvegarde de la valeur
                              if (index < 5) {
                                FocusScope.of(context)
                                    .nextFocus(); // Passer à la case suivante
                              }
                            } else {
                              _otpCodes[index] = ""; // Réinitialiser si vide
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer un chiffre'; // Validation
                            }
                            return null; // Pas d'erreur
                          },
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Bouton pour vérifier l'OTP
                  ElevatedButton(
                    onPressed: () {
                      // Logique de vérification de l'OTP (simulée ici)
                      bool otpIsValid =
                          true; // Remplace par ta logique de vérification

                      // Vérifier si tous les champs OTP sont remplis
                      for (String code in _otpCodes) {
                        if (code.isEmpty) {
                          otpIsValid = false;
                          break;
                        }
                      }

                      if (otpIsValid) {
                        // Rediriger vers la page de changement de mot de passe
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChangePasswordScreen()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Veuillez remplir tous les champs OTP.')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.orange[700], // Couleur de fond du bouton
                      padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02), // Marge verticale
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // Arrondi des bords
                      ),
                    ),
                    child: Text(
                      'Vérifier OTP',
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.045,
                        color: Colors.white,
                      ), // Style du texte
                    ),
                  ),
                ],

                // Lien vers l'écran de connexion
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Retour à l'écran de connexion
                  },
                  child: Text(
                    'Retour à la connexion',
                    style: GoogleFonts.poppins(
                        color: Colors.black), // Style du texte
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
