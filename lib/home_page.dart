import 'package:flutter/material.dart';
import 'package:mon_immobilier_sur/data/data.dart';
import 'package:mon_immobilier_sur/widgets/property_card.dart';
import 'package:mon_immobilier_sur/model/house.dart'; // Import de votre modèle House

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "";
  String selectedFilter = "Tous";
  RangeValues priceRange = RangeValues(0, 200000);

  // Liste des catégories de propriétés
  final categories = [
    "Maisons",
    "Appartements",
    "Terrains",
    "Studios",
    "Bureaux"
  ];

  List<House> filteredHouses = houses; // Liste des maisons filtrées

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête avec l'image de chargement et l'icône de notification
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/loading_image.png', height: 80),
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.orange),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Barre de recherche et filtre
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Rechercher une propriété...",
                      prefixIcon: Icon(Icons.search, color: Colors.orange),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.filter_list, color: Colors.orange),
                  onPressed: () {
                    _showFilterBottomSheet(context);
                  },
                ),
              ],
            ),

            SizedBox(height: 20),
            // Liste des catégories sous forme de chips
Row(
  children: [
    Expanded(
      child: SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: categories.map((category) {
            final isSelected = selectedCategory == category;
            return GestureDetector(
              onTap: () {
                setState(() {
                  // Deselect the category if it's already selected, or select it if it's not
                  selectedCategory = isSelected ? "" : category;
                  _applyFilters(); // Appliquer les filtres
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(
                  label: Text(
                    category,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                  backgroundColor:
                      isSelected ? Colors.orange : Colors.grey[200],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ),
  ],
),


            SizedBox(height: 20),

            // Liste des propriétés sous forme de cartes
            Expanded(
              child: ListView.builder(
                itemCount: filteredHouses.length,
                itemBuilder: (context, index) {
                  final house = filteredHouses[index];
                  return PropertyCard(house: house); // Affiche chaque propriété
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fonction pour afficher la feuille de filtre
  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Permet au BottomSheet de s'ajuster à la taille du contenu
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                // Permet de faire défiler le contenu si nécessaire
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre de la feuille de filtre
                    Text(
                      "Filtrer les propriétés",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 16),

                    // Filtrer par statut
                    Text(
                      "Statut",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: ["Tous", "À Louer", "À Acheter"].map((filter) {
                        return ChoiceChip(
                          label: Text(
                            filter,
                            style: TextStyle(
                              color: selectedFilter == filter
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12,
                            ),
                          ),
                          selected: selectedFilter == filter,
                          selectedColor: Colors.orange,
                          onSelected: (selected) {
                            setState(() {
                              selectedFilter = selected ? filter : 'Tous';
                              _applyFilters(); // Appliquer les filtres
                            });
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),

                    // Filtrer par plage de prix
                    Text(
                      "Plage de prix",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    RangeSlider(
                      values: priceRange,
                      min: 0,
                      max: 200000,
                      divisions: 20,
                      activeColor: Colors.orange, // Couleur active
                      inactiveColor: Colors.grey[300],
                      labels: RangeLabels(
                        "${priceRange.start.round()} FCFA",
                        "${priceRange.end.round()} FCFA",
                      ),
                      onChanged: (RangeValues newRange) {
                        setState(() {
                          priceRange = newRange;
                          _applyFilters(); // Appliquer les filtres
                        });
                      },
                    ),
                    SizedBox(height: 8),

                    // Affichage de la plage de prix sélectionnée
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "De ${priceRange.start.round()} FCFA à ${priceRange.end.round()} FCFA",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Boutons Appliquer et Réinitialiser
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Bouton Réinitialiser
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedFilter =
                                  'Tous'; // Réinitialiser le filtre
                              priceRange = RangeValues(
                                  0, 200000); // Réinitialiser la plage de prix
                              selectedCategory =
                                  ""; // Réinitialiser la catégorie
                              _applyFilters(); // Appliquer les filtres
                            });
                          },
                          child: Text(
                            "Réinitialiser",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.orange, width: 1),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        // Bouton Appliquer les filtres
                        ElevatedButton(
                          onPressed: () {
                            // Implémenter la logique pour appliquer les filtres ici
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Appliquer les filtres",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Fonction pour appliquer les filtres
  void _applyFilters() {
    setState(() {
      filteredHouses = houses.where((house) {
        bool matchesCategory =
            selectedCategory.isEmpty || house.category == selectedCategory;
        bool matchesFilter =
            selectedFilter == 'Tous' || house.status == selectedFilter;
        bool matchesPrice =
            house.price >= priceRange.start && house.price <= priceRange.end;

        return matchesCategory && matchesFilter && matchesPrice;
      }).toList();
    });
  }
}
