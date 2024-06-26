import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/controller/home_controller/homecontroller.dart';
import 'package:rent_cruise/features/profile/view/yourProfile.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';
import 'package:rent_cruise/view/Profile/helpCenter.dart';
import 'package:rent_cruise/view/Profile/privacy.dart';
import 'package:rent_cruise/features/authentication/view/login_scrren.dart';
import 'package:rent_cruise/view/home_screen/All_Category.dart';
import 'package:rent_cruise/view/notification_screen/notification_screen.dart';
import 'package:rent_cruise/view/search_screen/search_screen.dart';
import 'package:share_plus/share_plus.dart';

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
              // Scaffold.of(context).openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Urban Lease",
            style: TextStyle(
                color: ColorConstant.primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                //
              },
              child: Icon(
                Icons.location_on,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                //
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
        drawer: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Muneef Nk',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'muneef@gmail.com',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(25),
                  child: Wrap(
                    runSpacing: 8,
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.account_circle_outlined,
                          color: ColorConstant.primaryColor,
                        ),
                        title: Text("Profile"),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => YourProfile()));
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.bookmark_add_outlined,
                          color: ColorConstant.primaryColor,
                        ),
                        title: Text("Saved"),
                        onTap: () {
                          Navigator.of(context).pop();
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => favourite_screeen()));
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.sell_outlined,
                          color: ColorConstant.primaryColor,
                        ),
                        title: Text("My Orders"),
                        onTap: () {
                          Navigator.of(context).pop();
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => order_screen()));
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.group_add_outlined,
                          color: ColorConstant.primaryColor,
                        ),
                        title: Text("Invites Friends"),
                        onTap: () {
                          final String whatsappLink =
                              "https://your-link-here.com";
                          Share.share("Check out this link: $whatsappLink",
                              subject: "Share Link");
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.info_outline,
                          color: ColorConstant.primaryColor,
                        ),
                        title: Text("Help Center"),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HelpCenter()));
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.security_outlined,
                          color: ColorConstant.primaryColor,
                        ),
                        title: Text("Privacy Policy"),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PrivacyPolicy()));
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.logout_outlined,
                          color: ColorConstant.primaryColor,
                        ),
                        title: Text("logout"),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => search_screen()));
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
                                    print(activeIndex);
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
                                dotsCount: provider.sliderImages.length,
                                position: activeIndex,
                              ),
                            ),
                          ],
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
                                        // Navigator.of(context).push(MaterialPageRoute(
                                        //     builder: (context) => SelectedCategory(
                                        //           selectedIndex: index,
                                        //         )));
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
                            return Text("");
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
                                      MediaQuery.sizeOf(context).height * .3,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            DocumentSnapshot product =
                                snapshot.data!.docs[index];

                            return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          child: Image.network(
                                            product['mainImage'],
                                            height: 150,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.bookmark_outline,
                                              size: 28,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
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
                                          Icon(
                                            Icons.shopping_cart_outlined,
                                            size: 25,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
