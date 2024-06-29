// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:rent_cruise/database/db.dart';
// import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';
// import 'package:rent_cruise/view/product_detail_screen/product_detail_screen.dart';

// class SelectedCategory extends StatefulWidget {
//   int selectedIndex;

//   SelectedCategory({Key? key, required this.selectedIndex}) : super(key: key);
//   // int get getCategoryIndex => selectedIndex;
//   // set setCategoryIndex(int index) {
//   //   selectedIndex = index;
//   // }

//   @override
//   State<SelectedCategory> createState() => _SelectedCategoryState();
// }

// class _SelectedCategoryState extends State<SelectedCategory> {
//   @override
//   Widget build(BuildContext context) {
//     int selectedCategoryIndex = widget.selectedIndex;

//     List<dynamic> datalist =
//         Database.categories[widget.selectedIndex]["details"] ?? [];

//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: Icon(
//             Icons.arrow_back_ios,
//             color: ColorConstant.primaryColor,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           "Category",
//           style: TextStyle(fontSize: 20, color: ColorConstant.primaryColor),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               height: 45,
//               child: ListView.builder(
//                 itemCount: Database.categories.length,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedCategoryIndex = index;
//                         widget.selectedIndex = index;
//                       });
//                     },
//                     child: selectedCategoryIndex == index
//                         ? Container(
//                             margin: EdgeInsets.only(left: 10),
//                             padding: EdgeInsets.symmetric(horizontal: 10),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: ColorConstant.primaryColor),
//                             child: Center(
//                               child: Text(
//                                 Database.categories[index]["categoryName"],
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           )
//                         : Container(
//                             margin: EdgeInsets.only(left: 10),
//                             padding: EdgeInsets.symmetric(horizontal: 10),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 border:
//                                     Border.all(color: Colors.grey.shade300)),
//                             child: Center(
//                               child: Text(
//                                 Database.categories[index]["categoryName"],
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20),
//                   child: Text(
//                     "List of products (${datalist.length})",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ListView.builder(
//               itemCount: datalist.length,
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     print(index);
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => ProductDetailsScreen(
//                               index: index,
//                               categoryIndex: widget.selectedIndex,
//                               isDirecthome: false,
//                             )));
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.90,
//                     margin: EdgeInsets.only(bottom: 20, right: 15, left: 15),
//                     height: 100,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.shade300,
//                           spreadRadius: 1,
//                           blurRadius: 1,
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.white,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20, right: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Image.asset(
//                             datalist[index].image_png,
//                             width: 150,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Text(
//                                 datalist[index].productName,
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     datalist[index].rating,
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.amber,
//                                     size: 20,
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                 ],
//                               ),
//                               Text(
//                                 "${datalist[index].price ?? 560} / Days",
//                                 style: TextStyle(
//                                   fontSize: 19,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           GestureDetector(
//                               onTap: () {
//                                 //
//                               },
//                               child: Icon(Icons.more_vert)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
