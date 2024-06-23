// import 'package:flutter/material.dart';
// import 'package:panara_dialogs/panara_dialogs.dart';
// import 'package:provider/provider.dart';
// import 'package:rent_cruise/controller/checkout_controller/checkout_controller.dart';
// import 'package:rent_cruise/database/db.dart';
// import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';
// import 'package:rent_cruise/view/bottom_navigation/bottom_navigation.dart';
// import 'package:rent_cruise/shared/pages/payment_methods_screen/payment_methods_screen.dart';

// class Checkout_screen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<CheckoutController>(context);
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         leading: InkWell(
//             onTap: () {
//               if (provider.checkoutList.isNotEmpty) {
//                 PanaraConfirmDialog.show(
//                   context,
//                   imagePath: "assets/images/warning.png",
//                   title: "Hello",
//                   message:
//                       "Are you sure back to homescreen if confirm all product remove",
//                   confirmButtonText: "Confirm",
//                   cancelButtonText: "Cancel",
//                   onTapCancel: () {
//                     Navigator.pop(context);
//                   },
//                   onTapConfirm: () {
//                     provider.totalAmmount = 0;
//                     Provider.of<CheckoutController>(context, listen: false)
//                         .clearAllProducts();
//                     Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(builder: (context) => BottomNav()),
//                         (route) => false);
//                   },
//                   panaraDialogType: PanaraDialogType.warning,
//                   barrierDismissible:
//                       true, // optional parameter (default is true)
//                 );
//               } else {
//                 Navigator.of(context).pop();
//               }
//             },
//             child: Icon(
//               Icons.arrow_back,
//               color: ColorConstant.primaryColor,
//             )),
//         title: Text(
//           "Check Out",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       bottomNavigationBar: Container(
//         margin: EdgeInsets.all(5),
//         height: 60,
//         decoration: BoxDecoration(
//             color: ColorConstant.primaryColor,
//             borderRadius: BorderRadius.circular(10)),
//         child: InkWell(
//           onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => PaymentMethods(),
//               )),
//           child: Center(
//             child: Text(
//               "Continue To Payment",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                   color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 45,
//               width: MediaQuery.of(context).size.width * 0.9,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   "Product items",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17),
//                 ),
//               ),
//             ),
//             ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: provider.checkoutList.length,
//               itemBuilder: (context, index) => Container(
//                 // color: Colors.amber,
//                 height: 120,
//                 child: Row(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.only(left: 20),
//                       margin: EdgeInsets.only(bottom: 10),
//                       width: 130,
//                       height: 110,
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.network(
//                             provider.checkoutList[index].img,
//                             fit: BoxFit.cover,
//                           )),
//                     ),
//                     SizedBox(
//                       width: 25,
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.49,
//                           child: Text(
//                             Database.random[index].productName,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 18),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         Text(
//                           "${Database.random[index].price} / Day",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 15,
//                               color: Colors.grey[600]),
//                         ),
//                         Text(
//                           "Selected ${provider.checkoutList[index].selectedDays} Day",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey[700]),
//                         ),
//                         Text(
//                           "Total: ₹${provider.checkoutList[index].totalPrice}",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                               fontSize: 17),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         )
//                       ],
//                     ),
//                     Spacer(),
//                     GestureDetector(
//                         onTap: () {
//                           Provider.of<CheckoutController>(context,
//                                   listen: false)
//                               .deleteProduct(index);
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 20),
//                           child: Icon(
//                             Icons.delete_outline,
//                             color: Colors.red,
//                           ),
//                         ))
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
