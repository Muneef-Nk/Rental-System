import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/features/cart_screen/provider/card_screen_controller.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

class CartContainer extends StatelessWidget {
  final int index;

  const CartContainer({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    print(index);
    final provider = Provider.of<CardScreenController>(context);
    final product = provider.cardlist[index];

    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          width: 130,
          height: 130,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 207, 207, 205),
              borderRadius: BorderRadius.circular(15)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              product.img,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 200,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        product.name,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          PanaraConfirmDialog.show(
                            context,
                            imagePath: "assets/images/warning.png",
                            title: "Hello",
                            message:
                                "Proceed to remove all products and return to the home screen?",
                            confirmButtonText: "Confirm",
                            cancelButtonText: "Cancel",
                            onTapCancel: () {
                              Navigator.pop(context);
                            },
                            onTapConfirm: () {
                              Provider.of<CardScreenController>(context,
                                      listen: false)
                                  .calculateAfterDeletedProductPrice(
                                      double.parse(
                                          provider.cardlist[index].totalPrice));
                              Provider.of<CardScreenController>(context,
                                      listen: false)
                                  .deleteProduct(index);

                              Navigator.pop(context);
                            },
                            panaraDialogType: PanaraDialogType.error,
                            barrierDismissible:
                                false, // optional parameter (default is true)
                          );
                        },
                        child: Icon(Icons.delete))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${product.perdayprice}/day',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'hkjhkh',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                          color: ColorConstant.primaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          '${product.selectedDays} days',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "₹${product.totalPrice}",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
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
    );
  }
}
