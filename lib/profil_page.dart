import 'package:flutter/material.dart';
import 'package:mon_immobilier_sur/widgets/profil/add_property.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // En-tête profil avec fond coloré
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.orange[300],
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(
                          'assets/images/user.png'), // Remplace par l'image par défaut
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Ipote Kohan',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Agent Immobilier',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Redirections pour la gestion des propriétés
                    ProfileOption(
                      icon: Icons.add_home,
                      color: Colors.orange,
                      title: 'Ajouter une propriété',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddProperty()),
                        );
                      },
                    ),
                    ProfileOption(
                      icon: Icons.square_foot,
                      color: Colors.green,
                      title: 'Ajouter un terrain',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessagesPage()),
                        );
                      },
                    ),
                    ProfileOption(
                      icon: Icons.list,
                      color: Colors.blue,
                      title: 'Liste des propriétés',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PropertyListPage()),
                        );
                      },
                    ),
                    ProfileOption(
                      icon: Icons.show_chart,
                      color: Colors.orangeAccent,
                      title: 'Statistiques',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StatisticsPage()),
                        );
                      },
                    ),
                    ProfileOption(
                      icon: Icons.settings,
                      color: Colors.grey,
                      title: 'Paramètres du profil',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileSettingsPage()),
                        );
                      },
                    ),
                    SizedBox(height: 30),

                    // Bouton de déconnexion
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Déconnexion réussie !')),
                        );
                      },
                      child: Text('Déconnexion',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget pour une option de profil
class ProfileOption extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({
    required this.icon,
    required this.color,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: color, size: 30),
        title: Text(
          title,
          style: TextStyle(fontSize: 16), // Réduction de la taille du texte
        ),
        onTap: onTap,
      ),
    );
  }
}

// Exemple de page pour la gestion des propriétés
class PropertyManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestion des Propriétés')),
      body: Center(child: Text('Ici, vous gérez vos propriétés.')),
    );
  }
}

// Exemple de page pour la liste des propriétés
class PropertyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste des Propriétés')),
      body: Center(child: Text('Voici la liste de toutes vos propriétés.')),
    );
  }
}

// Exemple de page pour les messages
class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages')),
      body: Center(child: Text('Ici, vous pouvez consulter vos messages.')),
    );
  }
}

// Exemple de page pour les statistiques
class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistiques')),
      body: Center(child: Text('Ici, vous pouvez voir vos statistiques.')),
    );
  }
}

// Exemple de page pour les paramètres du profil
class ProfileSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Paramètres du Profil')),
      body: Center(child: Text('Ici, vous pouvez modifier vos paramètres.')),
    );
  }
}
