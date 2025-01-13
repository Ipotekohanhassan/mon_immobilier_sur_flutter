import 'package:mon_immobilier_sur/model/house.dart';

final List<House> houses = [
  House(
    title: "Beautiful Family Home",
    description: """
    Cette belle maison individuelle, située dans un quartier résidentiel paisible, offre un cadre de vie idéal pour une famille. 
    Avec 4 chambres, un grand salon lumineux et une cuisine moderne ouverte sur la salle à manger, elle vous garantit un espace de vie confortable et fonctionnel. 
    La maison bénéficie d'une agréable luminosité grâce à ses grandes baies vitrées, qui offrent une vue sur un magnifique jardin paysager. 
    Vous apprécierez également la terrasse idéale pour vos repas en extérieur et les moments de détente en famille. 
    Le garage spacieux et les nombreux rangements ajoutent à la praticité de la maison. À proximité des écoles, des parcs et des commerces, 
    cette maison allie tranquillité et accessibilité, un véritable havre de paix pour une vie de famille épanouie.
  """,
    location: "Abidjan, Côte d'Ivoire",
    price: 100000,
    status: "À Louer",
    category: "Maisons",
    imageUrl:
        "assets/images/house1.jpeg",
    bedrooms: 3,
    bathrooms: 2,
    kitchen: 1,
    garage: 1,
    longitude: -4.008, 
    latitude: 5.336, 
    area: 550.0, 
    floorPlan:
        'assets/images/floor_plan2.jpg', 
    otherImages: [
      'assets/images/indoor4.jpg', 
      'assets/images/indoor5.jpg', 
      'assets/images/indoor1.jpg', 
    ],
  ),
  House(
    title: "Modern Apartment",
    description: """
    Situé dans un quartier calme et recherché, cet appartement lumineux de 2 chambres est le cadre idéal pour votre vie urbaine. 
    Avec ses grandes fenêtres, il bénéficie d'une lumière naturelle tout au long de la journée, offrant une vue spectaculaire sur la ville. 
    La cuisine ouverte, entièrement équipée avec des appareils modernes, s'intègre parfaitement au séjour spacieux, parfait pour recevoir vos invités. 
    L'appartement dispose également d'une salle de bains moderne avec une douche à l'italienne et de nombreux rangements.
    La terrasse privée vous permet de profiter des journées ensoleillées, tandis que la proximité des commerces, des écoles et des transports en commun vous garantit une vie pratique et confortable.
    Parfait pour une jeune famille ou un professionnel à la recherche de confort et de commodité.
  """,
    location: "Bouaké, Côte d'Ivoire",
    price: 150000,
    status: "À Acheter",
    category: "Appartements",
    imageUrl:
        "assets/images/house2.jpeg",
    bedrooms: 2,
    bathrooms: 1,
    kitchen: 1,
    garage: 0,
    longitude: -17.465239,
    latitude: 14.692126, 
    area: 350.0, 
    floorPlan:
        'assets/images/floor_plan3.jpg', 
    otherImages: [
      'assets/images/indoor1.jpg', 
      'assets/images/indoor2.jpg', 
      'assets/images/indoor3.jpg', 
    ],
  ),
  
  // Add more sample data as needed
];
