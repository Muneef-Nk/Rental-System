import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/features/cart_screen/provider/card_screen_controller.dart';
import 'package:rent_cruise/features/category/view/All_Category.dart';
import 'package:rent_cruise/features/category/view/selected_category.dart';
import 'package:rent_cruise/features/favourite_screen/provider/saved_controller.dart';
import 'package:rent_cruise/features/home_screen/provider/homecontroller.dart';
import 'package:rent_cruise/features/home_screen/widgets/drawer.dart';
import 'package:rent_cruise/features/notification_screen/notification_screen.dart';
import 'package:rent_cruise/features/product_detail_screen/view/product_detail_screen.dart';
import 'package:rent_cruise/features/search_screen/view/search_screen.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';
import 'package:shimmer/shimmer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final PageController controller1 = PageController(viewportFraction: 0.8);
  CarouselController buttonCarouselController = CarouselController();
  int activeIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  CollectionReference category =
      FirebaseFirestore.instance.collection('categories');
  CollectionReference banners =
      FirebaseFirestore.instance.collection('banners');
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context);

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Rental System",
            style: TextStyle(
                color: ColorConstant.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: CircleAvatar(
                  child: Icon(
                    Icons.notifications_none,
                    color: ColorConstant.primaryColor,
                  ),
                  backgroundColor: Color.fromARGB(255, 231, 231, 231),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        drawer: DrawerSession(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchScreen()));
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      height: 55,
                      width: MediaQuery.sizeOf(context).width * .95,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade400)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(
                              width: 10,
                            ),
                            CarouselSlider.builder(
                              carouselController: buttonCarouselController,
                              options: CarouselOptions(
                                initialPage: 0,
                                aspectRatio: 4,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 10),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                scrollDirection: Axis.vertical,
                              ),
                              itemCount: provider.searchSlider.length,
                              itemBuilder: (context, index, realIndex) {
                                return Text(
                                    "Search ${provider.searchSlider[index]}",
                                    style: TextStyle(
                                        color: ColorConstant.primaryColor));
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  FutureBuilder(
                      future: banners.get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Stack(
                            children: [
                              CarouselSlider.builder(
                                carouselController: buttonCarouselController,
                                options: CarouselOptions(
                                  height: 200,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.3,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      activeIndex = index;
                                    });
                                  },
                                ),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index, realIndex) {
                                  DocumentSnapshot banners =
                                      snapshot.data!.docs[index];
                                  final urlImages = banners['image'];
                                  return Container(
                                    width: double.infinity,
                                    child: Image.network(
                                      urlImages,
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                },
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 20,
                                child: DotsIndicator(
                                  decorator: DotsDecorator(
                                      activeColor: ColorConstant.primaryColor,
                                      size: Size(20, 10)),
                                  dotsCount: snapshot.data!.docs.length,
                                  position: activeIndex,
                                ),
                              ),
                            ],
                          );
                        }
                        return Shimmer.fromColors(
                          baseColor: Color.fromARGB(255, 233, 233, 233),
                          highlightColor: Colors.white,
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0)),
                          ),
                        );
                      }),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, top: 5, right: 10, left: 10),
                        child: Row(
                          children: [
                            Text(
                              "Category",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: ColorConstant.primaryColor,
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AllCategory(),
                                  ),
                                );
                              },
                              child: Text(
                                "See All",
                                style: TextStyle(
                                  color: ColorConstant.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder(
                          future: category.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                height: 120,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot category =
                                        snapshot.data!.docs[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SelectedCategory(
                                                      category:
                                                          category['name'],
                                                    )));
                                      },
                                      child: Container(
                                        width: 100,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 38,
                                              backgroundImage: NetworkImage(
                                                  category['image']),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              '${category["name"]}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color:
                                                    ColorConstant.primaryColor,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                            return SizedBox(
                              height: 120,
                              child: ListView.separated(
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return Shimmer.fromColors(
                                    baseColor:
                                        Color.fromARGB(255, 233, 233, 233),
                                    highlightColor: Colors.white,
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Flash Rents",
                      style: TextStyle(
                          color: ColorConstant.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              FutureBuilder(
                  future: products.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        padding: EdgeInsets.all(9),
                        child: GridView.builder(
                          itemCount: snapshot.data?.docs.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 20,
                                  mainAxisExtent:
                                      MediaQuery.sizeOf(context).height * .32,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            DocumentSnapshot product =
                                snapshot.data!.docs[index];

                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
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
                                        bool isSaved = provider.isSaved(snapshot
                                            .data!.docs[index].id
                                            .toString());
                                        return Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
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
                                              child: InkWell(
                                                onTap: () {
                                                  Provider.of<SavedController>(
                                                          context,
                                                          listen: false)
                                                      .addToSave(snapshot
                                                          .data!.docs[index].id
                                                          .toString());
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
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
                                            padding: const EdgeInsets.all(8.0),
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
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Consumer<CardScreenController>(
                                                builder:
                                                    (context, provider, _) {
                                              bool isAddedCart =
                                                  provider.isSaved(
                                                snapshot.data!.docs[index].id
                                                    .toString(),
                                              );
                                              return InkWell(
                                                onTap: () {
                                                  provider.addToCart(
                                                      snapshot
                                                          .data!.docs[index].id
                                                          .toString(),
                                                      context);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: isAddedCart
                                                      ? Icon(
                                                          Icons.shopping_cart,
                                                          color: Colors.green,
                                                          size: 25,
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .shopping_cart_outlined,
                                                          size: 25,
                                                        ),
                                                ),
                                              );
                                            })
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
                    return Container(
                        padding: EdgeInsets.all(9),
                        child: GridView.builder(
                          itemCount: 10,
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
                            return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        child: Shimmer.fromColors(
                                          baseColor: Color.fromARGB(
                                              255, 233, 233, 233),
                                          highlightColor: Colors.white,
                                          child: Container(
                                            width: double.infinity,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                                    SizedBox(height: 10),
                                    Shimmer.fromColors(
                                      baseColor:
                                          Color.fromARGB(255, 233, 233, 233),
                                      highlightColor: Colors.white,
                                      child: Container(
                                        width: double.infinity,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Shimmer.fromColors(
                                            baseColor: Color.fromARGB(
                                                255, 233, 233, 233),
                                            highlightColor: Colors.white,
                                            child: Container(
                                              // width: 100,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Shimmer.fromColors(
                                            baseColor: Color.fromARGB(
                                                255, 233, 233, 233),
                                            highlightColor: Colors.white,
                                            child: Container(
                                              // width: 100,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Shimmer.fromColors(
                                      baseColor:
                                          Color.fromARGB(255, 233, 233, 233),
                                      highlightColor: Colors.white,
                                      child: Container(
                                        width: double.infinity,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
