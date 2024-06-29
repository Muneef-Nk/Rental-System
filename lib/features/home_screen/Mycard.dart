// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rent_cruise/controller/saved_screen_controller.dart/saved_controller.dart';
// import 'package:rent_cruise/database/db.dart';
// import 'package:rent_cruise/view/product_detail_screen/product_detail_screen.dart';

// class Mycard extends StatefulWidget {
//   const Mycard({super.key, required this.index});
//   final int index;

//   @override
//   State<Mycard> createState() => _MycardState();
// }

// class _MycardState extends State<Mycard> {
//   bool isFavorite = false;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         print(widget.index);
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => ProductDetailsScreen(
//                   index: widget.index,
//                   categoryIndex: 0,
//                   isDirecthome: true,
//                 )));
//       },
//       child: Container(
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey.shade300),
//             borderRadius: BorderRadius.circular(20)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(children: [
//               Container(
//                 decoration: BoxDecoration(
//                     color: Colors.black12,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20))),
//                 height: MediaQuery.sizeOf(context).height * .210,
//                 width: double.infinity,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20)),
//                   child: Image.asset(
//                     Database.random[widget.index].imgMain,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Positioned(
//                   top: 10,
//                   right: 10,
//                   child: GestureDetector(
//                       onTap: () {
//                         Provider.of<SavedController>(context, listen: false)
//                             .addtoSave(widget.index);
//                         setState(() {
//                           isFavorite = !isFavorite;
//                         });
//                       },
//                       child: isFavorite
//                           ? Icon(
//                               Icons.favorite,
//                               color: Colors.red,
//                             )
//                           : Icon(Icons.favorite_outline)))
//             ]),
//             Padding(
//               padding: const EdgeInsets.only(top: 5, left: 10),
//               child: Text(
//                 Database.random[widget.index].productName,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.justify,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 Database.random[widget.index].desc,
//                 style: TextStyle(fontSize: 13),
//                 textAlign: TextAlign.justify,
//                 maxLines: 2,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 5, right: 7),
//               child: Row(
//                 children: [
//                   Text(
//                     "₹ ${Database.random[widget.index].price}",
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),
//                   Spacer(),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.star,
//                         color: Colors.amber,
//                       ),
//                       Text(
//                         Database.random[widget.index].rating,
//                         style: TextStyle(fontSize: 17),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
