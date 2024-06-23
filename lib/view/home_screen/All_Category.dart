// import 'package:flutter/material.dart';
// import 'package:rent_cruise/database/db.dart';
// import 'package:rent_cruise/view/home_screen/seleted_category/selected_category.dart';

// class AllCategory extends StatefulWidget {
//   const AllCategory({super.key});

//   @override
//   State<AllCategory> createState() => _AllCategoryState();
// }

// class _AllCategoryState extends State<AllCategory> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text(
//           "Categories",
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: GridView.builder(
//           itemCount: Database.categories.length,
//           shrinkWrap: true,
//           // physics: NeverScrollableScrollPhysics(),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               mainAxisExtent: 230, crossAxisCount: 2),
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: EdgeInsets.only(top: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => SelectedCategory(
//                                 selectedIndex: index,
//                               )));
//                     },
//                     child: Container(
//                       height: 150,
//                       width: 150,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.asset(
//                           Database.categories[index]["categoryImage"] ?? "",
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 25, right: 25, top: 10),
//                     child: Text(
//                       Database.categories[index]["categoryName"] ?? 0,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   )
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }
