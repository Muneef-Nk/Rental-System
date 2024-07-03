import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/features/Payment_screen/payment_methods_screen.dart';
import 'package:rent_cruise/features/cart_screen/provider/card_screen_controller.dart';
import 'package:rent_cruise/features/cart_screen/view/cart_screen.dart';
import 'package:rent_cruise/features/favourite_screen/provider/saved_controller.dart';
import 'package:rent_cruise/features/product_detail_screen/controller/details_screen_controller.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String documentId;

  ProductDetailsScreen({Key? key, required this.documentId}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var uid;
  @override
  void initState() {
    super.initState();
    fetchData();

    Provider.of<CardScreenController>(context, listen: false).getCartProduct();
    getUid();
  }

  getUid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid');
    setState(() {}); // This should be safe now
  }

  fetchData() {
    Provider.of<ProductDetailsController>(context, listen: false).resetValues();
  }

  @override
  Widget build(BuildContext context) {
    final detailController = Provider.of<ProductDetailsController>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<DocumentSnapshot>(
                  future: products.doc(widget.documentId).get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          detailController.price = double.tryParse(
                                  snapshot.data?['price'].toString() ?? '0') ??
                              0;

                          detailController.lat = double.tryParse(
                                  snapshot.data?['lat'].toString() ?? '0') ??
                              0;
                          detailController.long = double.tryParse(
                                  snapshot.data?['long'].toString() ?? '0') ??
                              0;

                          // Call totalPriceCalc after price has been set
                          detailController
                              .totalPriceCalc(detailController.price);
                        });
                      });
                      return Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 300,
                                width: double.infinity,
                                child: Image.network(
                                  snapshot.data?['mainImage'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 15,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_back,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: ColorConstant.primaryColor,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 30,
                                top: 15,
                                child: Consumer<CardScreenController>(
                                    builder: (context, provider, _) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CartScreen()));
                                    },
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          child: Center(
                                            child: Icon(Icons.shopping_cart,
                                                size: 20, color: Colors.white),
                                          ),
                                          backgroundColor:
                                              ColorConstant.primaryColor,
                                        ),
                                        provider.cardlist.length != 0
                                            ? Positioned(
                                                right: 0,
                                                child: Container(
                                                  width: 18,
                                                  height: 18,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              244, 67, 54, 1),
                                                      shape: BoxShape.circle),
                                                  child: Center(
                                                      child: Text(
                                                    "${provider.cardlist.length}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                ),
                                              )
                                            : SizedBox()
                                      ],
                                    ),
                                  );
                                }),
                              ),
                              Positioned(
                                right: 80,
                                top: 15,
                                child: GestureDetector(
                                  onTap: () {
                                    Provider.of<SavedController>(context,
                                            listen: false)
                                        .addToSave(widget.documentId);
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    child: Provider.of<SavedController>(context,
                                                listen: false)
                                            .isSaved(widget.documentId)
                                        ? Icon(
                                            Icons.bookmark,
                                            size: 20,
                                            color: Colors.red,
                                          )
                                        : Icon(
                                            Icons.bookmark_outline,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                    backgroundColor: ColorConstant.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Text(
                                snapshot.data?['name'],
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Text(
                                snapshot.data?['description'] ?? '',
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Color.fromARGB(255, 233, 233, 233),
                          highlightColor: Colors.white,
                          child: Container(
                            width: double.infinity,
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Shimmer.fromColors(
                          baseColor: Color.fromARGB(255, 233, 233, 233),
                          highlightColor: Colors.white,
                          child: Container(
                            width: double.infinity,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Shimmer.fromColors(
                          baseColor: Color.fromARGB(255, 233, 233, 233),
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
                    );
                  }),
              Divider(
                color: Colors.grey,
                thickness: 0.1,
              ),
              FutureBuilder(
                  future: users.doc(uid).get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListTile(
                        leading: CircleAvatar(
                            radius: 26,
                            backgroundImage: NetworkImage(
                              snapshot.data?['image'],
                            )),
                        title: Text(
                          snapshot.data?['name'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        subtitle: Text(
                          snapshot.data?['email'],
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: Container(
                          width: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                          "assets/icons/whatsapp.png")),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                    onPressed: () {
                                      var number =
                                          snapshot.data?['phoneNumber'];
                                      final url = Uri.parse('tel:+91$number');
                                      print(url);
                                      launchUrl(url);
                                    },
                                    icon: Icon(
                                      Icons.call,
                                      color: Colors.blue,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return ListTile(
                      leading: Shimmer.fromColors(
                        baseColor: Color.fromARGB(255, 233, 233, 233),
                        highlightColor: Colors.white,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                        ),
                      ),
                      title: Shimmer.fromColors(
                        baseColor: Color.fromARGB(255, 233, 233, 233),
                        highlightColor: Colors.white,
                        child: Container(
                          width: double.infinity,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      subtitle: Shimmer.fromColors(
                        baseColor: Color.fromARGB(255, 233, 233, 233),
                        highlightColor: Colors.white,
                        child: Container(
                          width: double.infinity,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      trailing: Container(
                        width: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Color.fromARGB(255, 233, 233, 233),
                              highlightColor: Colors.white,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Shimmer.fromColors(
                              baseColor: Color.fromARGB(255, 233, 233, 233),
                              highlightColor: Colors.white,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              Divider(
                color: Colors.grey,
                thickness: 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "\$${detailController.price}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Gallery",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder<DocumentSnapshot>(
                  future: products.doc(widget.documentId).get(),
                  builder: (context, snapshot) {
                    var data = snapshot.data?.data() as Map<String, dynamic>?;

                    if (snapshot.hasData) {
                      return data?['athorImage1'] == null &&
                              data?['athorImage2'] == null &&
                              data?['athorImage3'] == null &&
                              data?['athorImage4'] == null
                          ? Center(child: Text("No more images added"))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                data?['athorImage1'] != null
                                    ? Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          child: Image.network(
                                            data?['athorImage1'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                                data?['athorImage2'] != null
                                    ? Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          child: Image.network(
                                            data?['athorImage2'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                                data?['athorImage3'] != null
                                    ? Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          child: Image.network(
                                            data?['athorImage3'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                                data?['athorImage4'] != null
                                    ? Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          child: Image.network(
                                            data?['athorImage4'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            );
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Color.fromARGB(255, 233, 233, 233),
                          highlightColor: Colors.white,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: Color.fromARGB(255, 233, 233, 233),
                          highlightColor: Colors.white,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: Color.fromARGB(255, 233, 233, 233),
                          highlightColor: Colors.white,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: Color.fromARGB(255, 233, 233, 233),
                          highlightColor: Colors.white,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "How long do you want to rent this for?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 90,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                        "${detailController.calculateTotalDays()} Days",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConstant.primaryColor,
                    ),
                    child: Center(
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(15),
                        dropdownColor: Colors.black,
                        underline: Text(""),
                        iconEnabledColor: Colors.white,
                        iconSize: 28,
                        value: detailController.selectedNumber,
                        onChanged: (value) {
                          detailController.selectedNumber = value!;
                          detailController.totalDays =
                              Provider.of<ProductDetailsController>(context,
                                      listen: false)
                                  .calculateTotalDays();
                          detailController
                              .totalPriceCalc(detailController.price);
                        },
                        items: List.generate(10, (index) {
                          return DropdownMenuItem<int>(
                            value: index + 1,
                            child: Text(
                              (index + 1).toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConstant.primaryColor,
                    ),
                    child: Center(
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(15),
                        dropdownColor: Colors.black,
                        style: TextStyle(color: Colors.amber),
                        underline: Text(""),
                        iconEnabledColor: Colors.white,
                        iconSize: 28,
                        value: detailController.selectedTimeUnit,
                        onChanged: (value) {
                          detailController.selectedTimeUnit = value!;
                          detailController.totalDays =
                              Provider.of<ProductDetailsController>(context,
                                      listen: false)
                                  .calculateTotalDays();
                          detailController
                              .totalPriceCalc(detailController.price);
                        },
                        items: detailController.timeUnits.map((unit) {
                          return DropdownMenuItem<String>(
                            value: unit,
                            child: Text(
                              unit,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: Text(
                  "Total Price: ₹${detailController.totalPrice}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Text(
                  "Location",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //
                  final url = Uri.parse(
                      'https://www.google.com/maps/@${detailController.lat},${detailController.long},15z/data=!5m1!1e1?entry=ttu');
                  print(url);
                  launchUrl(url);
                },
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 13, right: 13),
                    height: 190,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/images/map.png")),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 65,
          decoration: BoxDecoration(
              color: ColorConstant.primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'total: ${detailController.totalPrice}',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Text(
                    '${detailController.price}/day',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PaymentMethods()));
                },
                child: Container(
                  height: 40,
                  width: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Rent Now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
