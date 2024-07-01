// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rent_cruise/controller/saved_screen_controller.dart/saved_controller.dart';
// import 'package:rent_cruise/view/favourite_screen/card_screen/card_screen.dart';

// class favourite_screeen extends StatelessWidget {
//   const favourite_screeen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<SavedController>(context);
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//         ),
//         elevation: 0,
//         title: Text(
//           "Saved Products",
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GridView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     mainAxisExtent: 230, crossAxisCount: 2),
//                 itemCount: provider.savedLIst.length,
//                 itemBuilder: (context, index) {
//                   return card_screen(
//                     index: index,
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
