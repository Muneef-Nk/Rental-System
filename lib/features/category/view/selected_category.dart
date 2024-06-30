import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/features/category/provider/category_controller.dart';
import 'package:rent_cruise/features/category/widgets/category_container.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

class SelectedCategory extends StatefulWidget {
  final String category;

  SelectedCategory({Key? key, required this.category}) : super(key: key);

  @override
  State<SelectedCategory> createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCategory> {
  @override
  void initState() {
    super.initState();

    Provider.of<CategoryController>(context, listen: false).selectedCategories =
        [];
    Provider.of<CategoryController>(context, listen: false)
        .getProductFromCategory(widget.category);
  }

  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

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
          "Category",
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
            Consumer<CategoryController>(builder: (context, provider, child) {
              return ListView.builder(
                itemCount: provider.selectedCategories.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (provider.selectedCategories.isEmpty) {
                    return Center(
                      child: Text(
                        "No products found",
                        style: TextStyle(color: Colors.amber),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: provider.selectedCategories.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CategoryContainer(
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
