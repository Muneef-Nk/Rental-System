import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:m_toast/m_toast.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';
import 'package:rent_cruise/controller/add_card/add_card_controller.dart';
import 'package:rent_cruise/model/addCard/cardModel.dart';

class AddCardScreen extends StatefulWidget {
  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  TextEditingController _cardHolderNameController = TextEditingController();
  TextEditingController _cvvCodeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddCardController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        ),
        elevation: 0,
        title: Text(
          "Add Card",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomDropdown.search(
                  excludeSelected: true,
                  hintText: 'Select your bank',
                  items: provider.banksName,
                  onChanged: (value) {
                    print('changing value to: $value');
                    provider.selectedBankName = value;
                    setState(() {});
                  },
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorConstant.primaryColor),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "https://wallpaperaccess.com/full/1742495.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 78,
                        child: Text(
                          _cardNumberController.text,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Card Holder:",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _cardHolderNameController.text
                                        .toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ]),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Expire Date:",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _expiryDateController.text,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ]),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: Container(
                          height: 65,
                          width: 65,
                          child: Image.network(
                            "https://cdn2.iconfinder.com/data/icons/payment-2-filled/64/payment-11-512.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        top: 20,
                        child: Text(
                          "VISA",
                          style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your name",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey), // Add border
                        borderRadius: BorderRadius.circular(
                            8.0), // Optional: Add border radius for rounded corners
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter your name";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _cardHolderNameController.text = value;
                          });
                        },
                        maxLength: 20,
                        textInputAction: TextInputAction.next,
                        controller: _cardHolderNameController,
                        decoration: InputDecoration(
                          hintText: "Your Full Name",
                          counterText: '',
                          border: InputBorder
                              .none, // Remove default border of TextField
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0), // Adjust padding
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Card Number",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey), // Add border
                        borderRadius: BorderRadius.circular(
                            8.0), // Optional: Add border radius for rounded corners
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter your card number";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        maxLength: 12,
                        onChanged: (value) {
                          setState(() {
                            _cardNumberController.text = value;
                          });
                        },
                        controller: _cardNumberController,
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: "XXXX XXXX XXXX",
                          border: InputBorder
                              .none, // Remove default border of TextField
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0), // Adjust padding
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expiry Date",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey), // Add border
                              borderRadius: BorderRadius.circular(
                                  8.0), // Optional: Add border radius for rounded corners
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please select card expiry date";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.none,
                              onTap: () {
                                addDate();
                              },
                              controller: _expiryDateController,
                              decoration: InputDecoration(
                                hintText: "MM / YY",
                                border: InputBorder
                                    .none, // Remove default border of TextField
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0), // Adjust padding
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CVV",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey), // Add border
                              borderRadius: BorderRadius.circular(
                                  8.0), // Optional: Add border radius for rounded corners
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'enter cvv number';
                                }
                                return null;
                              },
                              maxLength: 3,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              onChanged: (value) {
                                setState(() {
                                  _cvvCodeController.text = value;
                                });
                              },
                              controller: _cvvCodeController,
                              decoration: InputDecoration(
                                counterText: "",
                                hintText: "XXX",
                                border: InputBorder
                                    .none, // Remove default border of TextField
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0), // Adjust padding
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                GestureDetector(
                  onTap: () {
                    onSubmit();
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ColorConstant.primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: provider.isLoading
                            ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Add Card",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  addDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));

    if (pickedDate != null) {
      setState(() {
        _expiryDateController.text =
            DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  onSubmit() {
    final provider = Provider.of<AddCardController>(context, listen: false);
    if (_formKey.currentState!.validate()) {
      if (provider.selectedBankName == '') {
        ShowMToast toast = ShowMToast(context);

        toast.errorToast(
            message: "Please Select Bank", alignment: Alignment.topCenter);
        print(provider.selectedBankName);
      } else {
        ShowMToast toast = ShowMToast(context);
        toast.successToast(
            message: "successfully added your card",
            alignment: Alignment.topCenter);
        provider.isLoading = true;

        Provider.of<AddCardController>(context, listen: false).addCard(
            CardModel(
                name: _cardHolderNameController.text,
                accountNumber: _cardNumberController.text,
                expiryDate: _expiryDateController.text,
                cvv: _cvvCodeController.text,
                bankName: provider.selectedBankName));
        setState(() {});

        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop();
          setState(() {
            provider.isLoading = false;
          });
        });
      }
    } else {
      ShowMToast toast = ShowMToast(context);

      toast.errorToast(
          message: "please enter all input Field",
          alignment: Alignment.topCenter);
    }
  }
}
