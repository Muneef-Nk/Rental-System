import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rent_cruise/controller/checkout_controller/checkout_controller.dart';
import 'package:rent_cruise/features/cart_screen/provider/card_screen_controller.dart';
import 'package:rent_cruise/features/cart_screen/widgets/cart_container.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CardScreenController>(context);

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Cart",
              style: TextStyle(color: ColorConstant.primaryColor),
            )),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: ColorConstant.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Total: ${provider.sum}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<CheckoutController>(context, listen: false)
                      .checkoutList = [
                    ...Provider.of<CardScreenController>(context, listen: false)
                        .cardlist
                  ];

                  Provider.of<CheckoutController>(context, listen: false)
                      .checkAmmount(provider.sum);
                  provider.sum = 0;

                  if (provider.cardlist.isNotEmpty) {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => Checkout_screen()));
                  } else {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.warning,
                      text: 'You must add atleast one item in the cart',
                    );
                  }
                },
                child: Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: StreamBuilder(
          stream: provider.cartStream,
          builder: (context, snapshot) {
            return provider.cardlist.isNotEmpty
                ? ListView.builder(
                    itemCount: provider.cardlist.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                        width: double.infinity,
                        height: 160,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(15)),
                        child: CartContainer(index: index),
                      );
                    })
                : Center(
                    child: Lottie.asset("assets/animations/emptyList.json"));
          },
        ));
  }
}
