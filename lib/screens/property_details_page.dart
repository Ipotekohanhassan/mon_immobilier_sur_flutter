import 'package:flutter/material.dart';
import 'package:mon_immobilier_sur/model/house.dart';
import 'package:mon_immobilier_sur/screens/schedule_visit_page.dart';

class PropertyDetailsPage extends StatefulWidget {
  final House house;

  PropertyDetailsPage({required this.house});

  @override
  _PropertyDetailsPageState createState() => _PropertyDetailsPageState();
}

class _PropertyDetailsPageState extends State<PropertyDetailsPage> {
  bool _isDescriptionExpanded =
      false; // For expanding/collapsing the description

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Back Button Icon
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.orange),
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
              ),
            ),
            SizedBox(height: 16),
            // Main image with rounded corners and icons for "favoris" and "partager"
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    widget.house.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Row(
                    children: [
                      _buildIcon(Icons.favorite_border), // Favoris icon
                      SizedBox(width: 8),
                      _buildIcon(Icons.share), // Partager icon
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Property Title and Price
            Text(
              widget.house.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "${widget.house.price} FCFA",
              style: TextStyle(fontSize: 18, color: Colors.orange),
            ),
            SizedBox(height: 16),
            // Location and Status
            Text("Location: ${widget.house.location}"),
            Text("Status: ${widget.house.status}"),
            SizedBox(height: 16),
            // Property Details with icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoColumn(
                    "Chambres", widget.house.bedrooms.toString(), Icons.bed),
                _buildInfoColumn(
                    "Sdb", widget.house.bathrooms.toString(), Icons.bathtub),
                _buildInfoColumn(
                    "Cuisine", widget.house.kitchen.toString(), Icons.kitchen),
                _buildInfoColumn("Garage", widget.house.garage.toString(),
                    Icons.directions_car),
              ],
            ),
            SizedBox(height: 16),
            // Property area
            Text("Surface: ${widget.house.area} m²"),
            SizedBox(height: 16),
            // Floor Plan Image covering full screen width
            Text("Plan de l'étage :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                widget.house.floorPlan,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Map Section
            Text("Localisation sur la carte :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              height: 200,
              color: Colors.grey[300],
              child: Center(child: Text("Map Placeholder")),
            ),
            SizedBox(height: 16),
            // Additional Images Carousel
            Text("Autres Images :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _buildImageCarousel(widget.house.otherImages),
            SizedBox(height: 16),
            // Description in a modern Card
            Text("Description :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.orange[50], // Light background for the card
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Description :",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                      _isDescriptionExpanded
                          ? widget.house.description
                          : widget.house.description.length > 100
                              ? widget.house.description.substring(0, 100) +
                                  '...'
                              : widget.house.description,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isDescriptionExpanded = !_isDescriptionExpanded;
                        });
                      },
                      child: Text(
                        _isDescriptionExpanded
                            ? 'Afficher moins'
                            : 'Afficher plus',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Button to schedule a visit
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScheduleVisitPage(propertyTitle: widget.house.title),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  'Prendre Rendez-vous',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for icons in the top right corner of the main image
  Widget _buildIcon(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(8),
      child: Icon(icon, color: Colors.orange),
    );
  }

  // Widget for property info with icons
  Widget _buildInfoColumn(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.orange),
        SizedBox(height: 4),
        Text(value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.black54)),
      ],
    );
  }

  // Carousel for additional images with full-screen functionality
  Widget _buildImageCarousel(List<String> images) {
    return SizedBox(
      height: 100,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FullScreenImage(
                    images: images,
                    initialIndex: index,
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(images[index], fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Full-Screen Image Page with scroll functionality
class FullScreenImage extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  FullScreenImage({required this.images, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        itemCount: images.length,
        controller: PageController(initialPage: initialIndex),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Center(
              child: Image.asset(
                images[index],
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          );
        },
      ),
    );
  }
}
