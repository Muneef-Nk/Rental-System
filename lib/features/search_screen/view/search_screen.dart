// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rent_cruise/features/search_screen/provider/search_controller.dart';
// import 'package:rent_cruise/model/search_screen.dart/search_item_model.dart';
// import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

// class search_screen extends StatefulWidget {
//   const search_screen({super.key});

//   @override
//   State<search_screen> createState() => _search_screenState();
// }

// class _search_screenState extends State<search_screen> {
//   @override
//   void initState() {
//     Provider.of<SearchScreenController>(context, listen: false).getData();
//     super.initState();
//   }

//   TextEditingController _searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<SearchScreenController>(context);

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//         ),
//         title: Text(
//           "Search",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.8,
//                       child: SearchBar(
//                           controller: _searchController, hintText: "Search"),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Provider.of<SearchScreenController>(context,
//                                 listen: false)
//                             .addSearchData(
//                                 SearchItemModel(place: _searchController.text));

//                         Provider.of<SearchScreenController>(context,
//                                 listen: false)
//                             .getData();
//                         _searchController.clear();
//                         setState(() {});
//                       },
//                       child: Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.grey.shade300,
//                                   blurRadius: 3,
//                                   spreadRadius: 1)
//                             ],
//                             borderRadius: BorderRadius.circular(10)),
//                         child: Icon(Icons.search),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//                 height: 60,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Recent",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 17),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Provider.of<SearchScreenController>(context,
//                                   listen: false)
//                               .deleteAll();
//                           Provider.of<SearchScreenController>(context,
//                                   listen: false)
//                               .getData();
//                           setState(() {});
//                         },
//                         child: Text(
//                           "Clear All",
//                           style: TextStyle(
//                               color: ColorConstant.primaryColor,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       )
//                     ],
//                   ),
//                 )),
//             SizedBox(
//               child: ListView.builder(
//                 itemCount: provider.searchList.length,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "${provider.searchList[index].place}",
//                               style: TextStyle(
//                                 color: ColorConstant.primaryColor,
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Provider.of<SearchScreenController>(context,
//                                         listen: false)
//                                     .deleteData(index);
//                                 Provider.of<SearchScreenController>(context,
//                                         listen: false)
//                                     .getData();
//                                 setState(() {});
//                               },
//                               child: Icon(
//                                 Icons.cancel,
//                                 color: ColorConstant.primaryColor,
//                               ),
//                             )
//                           ]),
//                     ),
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
