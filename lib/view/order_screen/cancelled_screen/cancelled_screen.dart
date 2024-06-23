// import 'package:flutter/material.dart';
// import 'package:rent_cruise/view/checkout_screen/checkout_screen.dart';

// import '../../../utils/color_constant.dart/color_constant.dart';

// class Cancelled_screen extends StatefulWidget {
//   const Cancelled_screen({super.key});

//   @override
//   State<Cancelled_screen> createState() => _Cancelled_screenState();
// }

// class _Cancelled_screenState extends State<Cancelled_screen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: 10,
//         itemBuilder: (context, index) => Card(
//           elevation: 1,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Container(
//                 padding: EdgeInsets.all(10),
//                 height: 100,
//                 width: 100,
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Image.network(
//                       "https://i.pinimg.com/564x/49/54/c8/4954c88ff4aadb23137332c8733ba79d.jpg",
//                       fit: BoxFit.cover,
//                     )),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "DSLR Camera",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     "400/day",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold, color: Colors.grey[800]),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     "Cancelled 5 days ago",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold, color: Colors.orange),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => Checkout_screen()));
//                   },
//                   child: Container(
//                     height: 40,
//                     width: 100,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: ColorConstant.primaryColor),
//                     child: Padding(
//                       padding: const EdgeInsets.all(7.0),
//                       child: Center(
//                         child: Text(
//                           "Re-Order",
//                           style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
