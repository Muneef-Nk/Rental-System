import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';
import 'package:rent_cruise/features/add_debit_cart/view/add_card_screen.dart';
import 'package:rent_cruise/features/Payment_screen/Payment_screen.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int _selectedPaymentOption = 10; // Initialize with the default value

  int selectedIndex = 10;
  CollectionReference debitCard =
      FirebaseFirestore.instance.collection('debitCard');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: ColorConstant.primaryColor,
            )),
        title: Text(
          "Payment Methods",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(5),
        height: 60,
        decoration: BoxDecoration(
            color: ColorConstant.primaryColor,
            borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Payment()));
          },
          child: Center(
            child: Text(
              "Confirm  Payment",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddCardScreen(),
                    )),
                child: Center(
                  child: ListTile(
                    leading: Container(
                      height: 40,
                      width: 50,
                      child: Image.network(
                        "https://clipartcraft.com/images/credit-card-logo-atm-6.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text(
                      "Create New Card",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: ColorConstant.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                "More Payment Options",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              // height: 280,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      height: 40,
                      width: 50,
                      child: Image.network(
                        "https://www.pngall.com/wp-content/uploads/5/PayPal-Logo-PNG-Free-Image.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      "Paypal",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Radio(
                      value: 1,
                      groupValue: _selectedPaymentOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentOption = value as int;
                        });
                      },
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Container(
                      height: 31,
                      width: 31,
                      child: Image.network(
                        "http://www.clipartbest.com/cliparts/7Ta/o4A/7Tao4Axqc.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text(
                      "Apple Pay",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Radio(
                      value: 2,
                      groupValue: _selectedPaymentOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentOption = value as int;
                        });
                      },
                    ),
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  ListTile(
                    leading: Container(
                      height: 30,
                      width: 30,
                      child: Image.network(
                        "https://cdn.icon-icons.com/icons2/836/PNG/512/Google_icon-icons.com_66793.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text(
                      "Google Pay",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Radio(
                      value: 3,
                      groupValue: _selectedPaymentOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentOption = value as int;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                "Recectly added cards",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            StreamBuilder(
              stream: debitCard.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot debitCard = snapshot.data!.docs[index];
                        return Container(
                          margin:
                              EdgeInsets.only(left: 15, right: 15, bottom: 15),
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddCardScreen(),
                                )),
                            child: Center(
                              child: GestureDetector(
                                onDoubleTap: () {
                                  //
                                },
                                child: RadioListTile(
                                  value: index,
                                  groupValue: selectedIndex,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedIndex = value!;
                                    });
                                  },
                                  activeColor: Colors.red,
                                  title: Text(
                                    "${debitCard["bank"]}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  secondary:
                                      Image.asset("assets/images/atm_cart.png"),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  print("no data found");
                }
                return Text("no card found");
              },
            )
          ],
        ),
      ),
    );
  }
}
