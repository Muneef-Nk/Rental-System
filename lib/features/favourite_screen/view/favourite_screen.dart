import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/features/favourite_screen/provider/saved_controller.dart';
import 'package:rent_cruise/features/favourite_screen/widgets/saved_product_loading.dart';
import 'package:rent_cruise/features/product_detail_screen/view/product_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class FavouriteScreeen extends StatefulWidget {
  FavouriteScreeen({super.key});

  @override
  State<FavouriteScreeen> createState() => _FavouriteScreeenState();
}

class _FavouriteScreeenState extends State<FavouriteScreeen> {
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SavedController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        title: Text(
          "Saved Products",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            provider.savedList.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "No saved products yet.",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                : FutureBuilder(
                    future: products
                        .where(FieldPath.documentId,
                            whereIn: provider.savedList)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List savedList = snapshot.data!.docs;
                        return Container(
                          padding: EdgeInsets.all(9),
                          child: GridView.builder(
                            itemCount: savedList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 20,
                                    mainAxisExtent:
                                        MediaQuery.sizeOf(context).height * .3,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              DocumentSnapshot product =
                                  snapshot.data!.docs[index];

                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(
                                              documentId: snapshot
                                                  .data!.docs[index].id
                                                  .toString())));
                                },
                                child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black12),
                                    child: Column(
                                      children: [
                                        Consumer<SavedController>(
                                            builder: (context, provider, _) {
                                          bool isSaved = provider.isSaved(
                                              snapshot.data!.docs[index].id
                                                  .toString());
                                          return Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10)),
                                                child: Image.network(
                                                  product['mainImage'],
                                                  height: 150,
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Provider.of<SavedController>(
                                                            context,
                                                            listen: false)
                                                        .addToSave(snapshot
                                                            .data!
                                                            .docs[index]
                                                            .id
                                                            .toString());
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: isSaved
                                                        ? Icon(
                                                            Icons.bookmark,
                                                            color: Colors.red,
                                                            size: 28,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .bookmark_outline,
                                                            size: 28,
                                                          ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "${product['name']}",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 9),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "\$${product['price']}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Icon(
                                                Icons.shopping_cart_outlined,
                                                size: 25,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            },
                          ),
                        );
                      }
                      return SavedProductLoading();
                    }),
          ],
        ),
      ),
    );
  }
}
