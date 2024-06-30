import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/features/category/provider/category_controller.dart';
import 'package:rent_cruise/features/product_detail_screen/view/product_detail_screen.dart';

class CategoryContainer extends StatelessWidget {
  final int index;
  const CategoryContainer({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryController>(builder: (context, provider, _) {
      return InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                documentId: provider.selectedCategories[index].documentId,
              ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          margin: EdgeInsets.only(bottom: 20, right: 15, left: 15),
          height: 100,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                width: 120,
                child: Image.network(
                  provider.selectedCategories[index].image, fit: BoxFit.cover,
                  // width: 150,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${provider.selectedCategories[index].name}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                    Text(
                      "\$${provider.selectedCategories[index].price}/day",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
