import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/features/cart_screen/view/cart_screen.dart';
import 'package:rent_cruise/features/home_screen/view/home_screen.dart';
import 'package:rent_cruise/features/my_products/view/my_products.dart';
import 'package:rent_cruise/features/profile/view/profile.dart';
import 'package:rent_cruise/features/upload_products/view/upload_products.dart';
import 'package:rent_cruise/service/location_service.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<LocationProvider>(context, listen: false).determinePosition();
  }

  int _currentIndex = 0;
  List screens = [
    Homescreen(),
    MyProductsScreeen(),
    UploadProducts(
      idEdit: false,
    ),
    CartScreen(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          Icon(Icons.person, color: Colors.black),
          Icon(Icons.inventory, color: Colors.black),
          Icon(
            Icons.add,
            color: Colors.black,
            size: 35,
          ),
          Icon(Icons.shopping_cart, color: Colors.black),
          Icon(Icons.person, color: Colors.black),
        ],
        inactiveIcons: [
          Text(
            "Home",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Products ",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Rent",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
        color: ColorConstant.primaryColor,
        circleColor: Colors.grey.withOpacity(0.4),
        height: 70,
        circleWidth: 50,
        // tabCurve: ,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
        padding: EdgeInsets.only(left: 7, right: 7, bottom: 7),
        cornerRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        // shadowColor: Colors.deepPurple,
        // circleShadowColor: Colors.deepPurple,
        elevation: 0,

        activeIndex: _currentIndex,
      ),
      body: screens[_currentIndex],
    );
  }
}
