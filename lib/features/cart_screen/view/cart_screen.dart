import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/features/cart_screen/provider/card_screen_controller.dart';
import 'package:rent_cruise/features/cart_screen/widgets/cart_container.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';
import 'package:shimmer/shimmer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CardScreenController>(context, listen: false).getCartProduct();
  }

  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

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
                  //
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
        body: provider.cardlist.length == 0
            ? Center(
                child: Lottie.asset("assets/animations/emptyList.json"),
              )
            : FutureBuilder(
                future: products
                    .where(FieldPath.documentId, whereIn: provider.cardlist)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List cartList = snapshot.data!.docs;
                    return ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (context, index) {
                          final cart = snapshot.data!.docs[index];
                          return Container(
                            margin:
                                EdgeInsets.only(top: 20, left: 15, right: 15),
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(15)),
                            child: CartContainer(
                              documentId: cart.id,
                              image: cart['mainImage'],
                              name: cart['name'],
                              price: cart['price'],
                            ),
                          );
                        });
                  }
                  return CartLoading();
                },
              ));
  }
}

class CartLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 100,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          // width: 100,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 100,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
