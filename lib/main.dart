import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/features/add_debit_cart/provider/add_card_controller.dart';
import 'package:rent_cruise/controller/checkout_controller/checkout_controller.dart';
import 'package:rent_cruise/features/favourite_screen/provider/saved_controller.dart';
import 'package:rent_cruise/features/search_screen/provider/search_controller.dart';
import 'package:rent_cruise/features/authentication/controller/login_controller.dart';
import 'package:rent_cruise/features/authentication/controller/signup_controller.dart';
import 'package:rent_cruise/features/bottom_navigation/bottom_navigation.dart';
import 'package:rent_cruise/features/cart_screen/provider/card_screen_controller.dart';
import 'package:rent_cruise/features/category/provider/category_controller.dart';
import 'package:rent_cruise/features/home_screen/provider/homecontroller.dart';
import 'package:rent_cruise/features/my_products/provider/my_products_controller.dart';
import 'package:rent_cruise/features/product_detail_screen/controller/details_screen_controller.dart';
import 'package:rent_cruise/features/profile/controller/profile_controller.dart';
import 'package:rent_cruise/features/upload_products/provider/upload_product_controller.dart';
import 'package:rent_cruise/firebase_options.dart';
import 'package:rent_cruise/model/search_screen.dart/search_item_model.dart';
import 'package:rent_cruise/service/location_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<SearchItemModel>('searchBox');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoginScreenController()),
          ChangeNotifierProvider(create: (context) => SignupController()),
          ChangeNotifierProvider(create: (context) => ProfileControllr()),
          ChangeNotifierProvider(create: (context) => CardScreenController()),
          ChangeNotifierProvider(create: (context) => UploadProductControllr()),
          ChangeNotifierProvider(create: (context) => CategoryController()),
          ChangeNotifierProvider(create: (context) => MyProductsController()),
          ChangeNotifierProvider(
              create: (context) => ProductDetailsController()),

          //--------------

          // ChangeNotifierProvider(
          //     create: (context) => ProductDetailsController()),
          ChangeNotifierProvider(create: (context) => LocationProvider()),
          ChangeNotifierProvider(create: (context) => SearchScreenController()),
          ChangeNotifierProvider(create: (context) => CheckoutController()),
          // ChangeNotifierProvider(create: (context) => CardScreenController()),
          ChangeNotifierProvider(create: (context) => AddCardController()),

          ChangeNotifierProvider(create: (context) => SavedController()),
          ChangeNotifierProvider(create: (context) => HomeController()),
          ChangeNotifierProvider(create: (context) => HomeController()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: "poppins"),
            home: RootScreen()));
  }
}
