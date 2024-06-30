import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/features/my_products/provider/my_products_controller.dart';
import 'package:rent_cruise/features/my_products/widget/product_container.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

class MyProductsScreeen extends StatefulWidget {
  @override
  State<MyProductsScreeen> createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<MyProductsScreeen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MyProductsController>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: ColorConstant.primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "My Products",
          style: TextStyle(fontSize: 20, color: ColorConstant.primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "List of products",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<MyProductsController>(builder: (context, provider, child) {
              return ListView.builder(
                itemCount: provider.productlist.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (provider.productlist.isEmpty) {
                    return Center(
                      child: Text(
                        "No products found",
                        style: TextStyle(color: Colors.amber),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: provider.productlist.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return MyProductContainer(
                          index: index,
                        );
                      },
                    );
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
