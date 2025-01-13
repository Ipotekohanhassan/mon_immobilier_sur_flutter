class House {
  final String title;
  final String description;
  final String location;
  final int price;
  final String status; // "A louer" or "A acheter"
  final String category;
  final String imageUrl;
  final int bedrooms;
  final int bathrooms;
  final int kitchen;
  final int garage;
  final double longitude;
  final double latitude;
  final double area;
  final String floorPlan;
  final List<String> otherImages;

  House(
      {required this.title,
      required this.description,
      required this.location,
      required this.price,
      required this.status,
      required this.category,
      required this.imageUrl,
      required this.bedrooms,
      required this.bathrooms,
      required this.kitchen,
      required this.garage,
      required this.longitude,
      required this.latitude,
      required this.area,
      required this.floorPlan,
      required this.otherImages});
}
