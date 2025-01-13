// import 'package:flutter/material.dart';
// import 'package:mon_immobilier_sur/model/house.dart';
// import 'package:mon_immobilier_sur/screens/details/components/bottom_buttons.dart';
// import 'package:mon_immobilier_sur/screens/details/components/carousel_images.dart';
// import 'package:mon_immobilier_sur/screens/details/components/custom_app_bar.dart';
// import 'package:mon_immobilier_sur/screens/details/components/house_details.dart';

// class DetailsScreen extends StatefulWidget {
//   final House house;

//   const DetailsScreen({super.key, required this.house});

//   @override
//   _DetailsScreenState createState() => _DetailsScreenState();
// }

// class _DetailsScreenState extends State<DetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Column(
//             children: [
//               Stack(
//                 children: [
//                   CarouselImages(widget.house.moreImagesUrl),
//                   const CustomAppBar(),
//                 ],
//               ),
//               Expanded(
//                   child: HouseDetails(
//                       widget.house)), // Use Expanded to take remaining space
//             ],
//           ),
//           const Positioned(
//             bottom: 0, // Position the button at the bottom
//             left: 0,
//             right: 0,
//             child: BottomButtons(),
//           ),
//         ],
//       ),
//     );
//   }
// }
