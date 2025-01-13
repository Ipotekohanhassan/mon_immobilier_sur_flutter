import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mon_immobilier_sur/auth/login_screen.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isAgentImmobilier = false;
  bool _obscureText = true;

  // Form field variables
  String? _name;
  String? _phoneNumber;
  String? _password;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjusted values for responsive design
    double fontSizeMedium = screenWidth * 0.045;
    double paddingMedium = screenHeight * 0.02;

    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Center(
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    // Logo Image
                    Center(
                      child: Image.asset(
                        'assets/images/loading_image.png',
                        height: screenHeight * 0.3,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Registration Title
                    Text(
                      "Inscrivez-vous",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.05,
                        color: Colors.orange[700],
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // Input Fields
                    _buildTextField(
                      labelText: 'Nom complet',
                      icon: Icons.person,
                      onSaved: (value) => _name = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre nom complet';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _buildTextField(
                      labelText: 'Numéro de téléphone',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      onSaved: (value) => _phoneNumber = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre numéro de téléphone';
                        }
                        if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                          return 'Veuillez entrer un numéro de téléphone valide';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    _buildTextField(
                      labelText: 'Mot de passe',
                      icon: Icons.lock,
                      obscureText: _obscureText,
                      onSaved: (value) => _password = value,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.orange[700],
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
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
                    SizedBox(height: paddingMedium),

                    // Agent Immobilier Toggle
                    Text(
                      "Êtes-vous agent immobilier ?",
                      style: GoogleFonts.poppins(
                        fontSize: fontSizeMedium,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 66, 66, 66),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildOvalButton(
                          label: "Oui",
                          selected: isAgentImmobilier,
                          onPressed: () => setState(() {
                            isAgentImmobilier = true;
                          }),
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        _buildOvalButton(
                          label: "Non",
                          selected: !isAgentImmobilier,
                          onPressed: () => setState(() {
                            isAgentImmobilier = false;
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    // Sign Up Button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Inscription réussie')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[700],
                        padding: EdgeInsets.symmetric(
                            vertical: 12), // Adjusted padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: Text(
                        'S\'inscrire',
                        style: GoogleFonts.poppins(
                          fontSize: fontSizeMedium,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // Login Link
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Déjà un compte ? Se connecter',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 12),
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

  // TextField Builder
  Widget _buildTextField({
    required String labelText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required FormFieldValidator<String> validator,
    required FormFieldSetter<String> onSaved,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.orange[100],
        labelText: labelText,
        labelStyle: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 14.0,
        ),
        prefixIcon: Icon(icon, color: Colors.orange[700], size: 20),
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 05, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
      style: GoogleFonts.poppins(fontSize: 12.0),
    );
  }

  // Oval Button Builder
  Widget _buildOvalButton({
    required String label,
    required bool selected,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          color: selected ? Colors.orange[700] : Colors.transparent,
          border: Border.all(color: Colors.orange[700]!),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            color: selected ? Colors.white : Colors.orange[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
