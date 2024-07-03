import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/features/my_products/provider/my_products_controller.dart';
import 'package:rent_cruise/features/product_detail_screen/view/product_detail_screen.dart';
import 'package:rent_cruise/features/upload_products/view/upload_products.dart';

class MyProductContainer extends StatelessWidget {
  final int index;
  const MyProductContainer({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProductsController>(builder: (context, provider, _) {
      return InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                documentId: provider.productlist[index].documentId,
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
                  provider.productlist[index].mainImage, fit: BoxFit.cover,
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
                      '${provider.productlist[index].name}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Provider.of<MyProductsController>(context,
                                    listen: false)
                                .deleteProduct(context, index);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all()),
                            child: Text(
                              'delete',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => UploadProducts(
                                idEdit: true,
                                descrition:
                                    provider.productlist[index].description,
                                documentId:
                                    provider.productlist[index].documentId,
                                mainImage:
                                    provider.productlist[index].mainImage,
                                name: provider.productlist[index].name,
                                price: provider.productlist[index].price,
                                subImage1:
                                    provider.productlist[index].subImage1,
                                subImage2:
                                    provider.productlist[index].subImage2,
                                subImage3:
                                    provider.productlist[index].subImage3,
                                subImage4:
                                    provider.productlist[index].subImage4,
                              ),
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all()),
                            child: Text(
                              'edit',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
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
