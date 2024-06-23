// import 'package:flutter/material.dart';
// import 'package:rent_cruise/database/db.dart';
// import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

// class card_screen extends StatefulWidget {
//   final int index;
//   const card_screen({super.key, required this.index});

//   @override
//   State<card_screen> createState() => _card_screenState();
// }

// class _card_screenState extends State<card_screen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: 200,
//           width: 160,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.white,
//               border: Border.all(color: Colors.grey.shade400)),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(children: [
//                 Container(
//                   height: 130,
//                   width: 160,
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(10)),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset(
//                       Database.random[widget.index].imgMain,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: () {},
//                     child: CircleAvatar(
//                         radius: 15,
//                         backgroundColor: ColorConstant.primaryColor,
//                         child: Icon(
//                           Icons.favorite,
//                           color: Colors.red,
//                           size: 18,
//                         )),
//                   ),
//                 )
//               ]),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SizedBox(
//                       width: 100,
//                       child: Text(
//                         Database.random[0].productName,
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, color: Colors.black),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                           size: 18,
//                         ),
//                         Text(
//                           Database.random[0].rating,
//                           style: TextStyle(color: Colors.black),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: Text(
//                   Database.random[0].price.toString(),
//                   style: TextStyle(fontSize: 12),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
