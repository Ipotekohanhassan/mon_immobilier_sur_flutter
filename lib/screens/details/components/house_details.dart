// import 'package:flutter/material.dart';
// import 'package:mon_immobilier_sur/constants/constants.dart';
// import 'package:mon_immobilier_sur/model/house.dart';

// class HouseDetails extends StatefulWidget {
//   final House house;

//   const HouseDetails(this.house, {super.key});

//   @override
//   _HouseDetailsState createState() => _HouseDetailsState();
// }

// class _HouseDetailsState extends State<HouseDetails> {
//   bool _isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView(
//         physics: const BouncingScrollPhysics(),
//         shrinkWrap: true,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               vertical: appPadding,
//               horizontal: appPadding,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '\$${widget.house.price.toStringAsFixed(3)}',
//                       style: const TextStyle(
//                         fontSize: 32, // Larger, modern look
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Text(
//                       widget.house.address,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Colors.orangeAccent, Colors.deepOrange],
//                     ),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Text(
//                     widget.house.status,
//                     style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: appPadding),
//             child: Text(
//               'Informations sur la Maison',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: appPadding),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 _buildHouseDetailIcon(
//                   Icons.bed,
//                   '${widget.house.bedRooms} Chambres',
//                 ),
//                 _buildHouseDetailIcon(
//                   Icons.bathtub,
//                   '${widget.house.bathRooms} Salles de bain',
//                 ),
//                 _buildHouseDetailIcon(
//                   Icons.garage,
//                   '${widget.house.garages} Garages',
//                 ),
//                 _buildHouseDetailIcon(
//                   Icons.square_foot,
//                   '${widget.house.sqFeet} sq ft',
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(appPadding),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Équipements',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   padding: const EdgeInsets.all(appPadding),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         blurRadius: 12,
//                       ),
//                     ],
//                   ),
//                   child: GridView.count(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     crossAxisCount: 3,
//                     children: List.generate(
//                       widget.house.equipments.length,
//                       (index) => _buildAmenityIcon(
//                         Icons.check_circle,
//                         widget.house.equipments[index],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(appPadding),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Localisation',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   height: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         blurRadius: 12,
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: const Center(
//                       child: Text("Localisation"),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(appPadding),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Plan de la maison',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   height: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         blurRadius: 12,
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: widget.house.floorPlanUrl ==
//                             null // Vérifie si le plan de la maison est disponible
//                         ? Stack(
//                             children: [
//                               Opacity(
//                                 opacity: 0.5,
//                                 child: Image.asset(
//                                   'images/default_floor_plan2.jpg', // Image par défaut si aucun plan
//                                   fit: BoxFit.cover,
//                                   width: double.infinity,
//                                   height: 200,
//                                 ),
//                               ),
//                               const Center(
//                                 child: Text(
//                                   'Aucun plan disponible pour cette propriété',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     backgroundColor: Colors.black54,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ],
//                           )
//                         : Image.asset(
//                             // Affiche le plan s'il est disponible
//                             widget.house.floorPlanUrl!,
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                             height: 200,
//                           ),
//                   ),
//                 ),

//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: appPadding,
//               right: appPadding,
//               bottom: appPadding * 2,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   child: Text(
//                     widget.house.description,
//                     maxLines: _isExpanded ? null : 3,
//                     overflow: _isExpanded
//                         ? TextOverflow.visible
//                         : TextOverflow.ellipsis,
//                     style: TextStyle(
//                       color: Colors.black.withOpacity(0.6),
//                       height: 1.5,
//                     ),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     setState(() {
//                       _isExpanded = !_isExpanded;
//                     });
//                   },
//                   child: Text(
//                     _isExpanded ? 'Afficher moins' : 'Afficher plus',
//                     style: const TextStyle(
//                       color: Colors.blueAccent,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 35,)
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAmenityIcon(IconData icon, String label) {
//     return Column(
//       children: [
//         Icon(
//           icon,
//           size: 30,
//           color: Colors.orangeAccent,
//         ),
//         const SizedBox(height: 5),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.grey[600],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildHouseDetailIcon(IconData icon, String label) {
//     return Column(
//       children: [
//         Icon(
//           icon,
//           size: 30,
//           color: Colors.blueAccent,
//         ),
//         const SizedBox(height: 5),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.grey[600],
//           ),
//         ),
//       ],
//     );
//   }
// }
