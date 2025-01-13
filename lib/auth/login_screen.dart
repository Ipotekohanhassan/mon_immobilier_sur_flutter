import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:mon_immobilier_sur/home_page.dart';
import 'package:mon_immobilier_sur/auth/forgot_password.dart';
import 'package:mon_immobilier_sur/auth/reg_screen.dart';
import 'package:mon_immobilier_sur/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _phoneNumber;
  String? _password;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Center(
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/loading_image.png',
                        height: screenHeight * 0.4,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "Connectez-vous",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.05,
                        color: Colors.orange[700],
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    _buildTextField(
                      labelText: 'Numéro de téléphone',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      onSaved: (value) => _phoneNumber = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer un numéro de téléphone';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _buildPasswordField(
                      labelText: 'Mot de passe',
                      onSaved: (value) => _password = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer un mot de passe';
                        }
                        if (value.length < 6) {
                          return 'Le mot de passe doit comporter au moins 6 caractères';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Fonctionnalité à venir')),
                        );
                      },
                      child: Text(
                        'Mot de passe oublié ?',
                        style: GoogleFonts.poppins(color: Colors.orange[700]),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[700],
                        padding: EdgeInsets.symmetric(
                          vertical: 12, // Diminue la taille verticale
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: Text(
                        'Se connecter',
                        style: GoogleFonts.poppins(
                          fontSize:
                              screenWidth * 0.04, // Diminue la taille du texte
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegScreen()),
                        );
                      },
                      child: Text(
                        'Pas de compte ? Inscrivez-vous',
                        style: GoogleFonts.poppins(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required FormFieldValidator<String> validator,
    required FormFieldSetter<String> onSaved,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.orange[100],
        labelText: labelText,
        labelStyle: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 14, // Taille réduite du texte placeholder
        ),
        prefixIcon: Icon(icon, color: Colors.orange[700]),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
    );
  }

  Widget _buildPasswordField({
    required String labelText,
    required FormFieldValidator<String> validator,
    required FormFieldSetter<String> onSaved,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.orange[100],
        labelText: labelText,
        labelStyle: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 14, // Taille réduite du texte placeholder
        ),
        prefixIcon: Icon(Icons.lock, color: Colors.orange[700]),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.orange[700],
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(15.0), // Uniforme pour tous les champs
        ),
      ),
      obscureText: !_isPasswordVisible,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
