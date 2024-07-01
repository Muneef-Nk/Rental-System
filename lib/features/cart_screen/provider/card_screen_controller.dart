// import 'dart:async';

// import 'package:flutter/material.dart';

// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

// class CardScreenController with ChangeNotifier {
//   List<CheckoutCartModel> cardlist = [];
//   bool exist = false;
//   double sum = 0;

//   final _cartController = StreamController<List<CheckoutCartModel>>.broadcast();

//   Stream<List<CheckoutCartModel>> get cartStream => _cartController.stream;

//   void dispose() {
//     super.dispose();
//     _cartController.close();
//   }

// // if product already have list product not saved if no product added to the list
//   addProductToCart({
//     required String id,
//     required int index,
//     required BuildContext context,
//     required int categoryIndex,
//     required bool isDirectHome,
//     required String totalPrice,
//     required String selectedDays,
//     required String price,
//   }) {
//     if (exist) {
//       showTopSnackBar(
//         animationDuration: Duration(seconds: 1),
//         displayDuration: Duration(milliseconds: 2),
//         Overlay.of(context),
//         CustomSnackBar.info(
//           message: " Product Already Added to Cart",
//         ),
//       );
//       notifyListeners();
//     } else {
//       // cardlist.add(CheckoutCartModel(
//       //   id: id,
//       //   img: isDirectHome ? product.imgMain : ctProducts.imgMain,
//       //   name: isDirectHome ? product.productName : ctProducts.productName,
//       //   totalPrice: totalPrice,
//       //   selectedDays: selectedDays,
//       //   perdayprice: price,
//       // ));

//       showTopSnackBar(
//         animationDuration: Duration(seconds: 1),
//         displayDuration: Duration(milliseconds: 2),
//         Overlay.of(context),
//         CustomSnackBar.success(
//           message: "Product Successfully Added to Cart",
//         ),
//       );

//       calculateAllProductPrice();
//       notifyListeners();
//     }
//     notifyListeners();
//   }

// //delete product from the cart list
//   deleteProduct(int index) {
//     cardlist.removeAt(index);
//     notifyListeners();
//   }

//   calculateAllProductPrice() {
//     cardlist.forEach(
//       (element) {
//         sum += double.parse(element.totalPrice);
//         notifyListeners();
//       },
//     );
//     notifyListeners();
//   }

//   calculateAfterDeletedProductPrice(double price) {
//     sum = sum - price;

//     notifyListeners();
//   }
// }
