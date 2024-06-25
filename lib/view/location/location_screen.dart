import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_cruise/service/location_service.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';
import 'package:rent_cruise/features/bottom_navigation/bottom_navigation.dart';
import 'package:rent_cruise/view/location/search_location.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 80,
            child: Icon(
              Icons.location_on,
              size: 90,
              color: ColorConstant.primaryColor,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "What is your location?",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "we need to know location in order to suggest\nnearby service",
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Provider.of<LocationProvider>(context, listen: false)
                  .determinePosition();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => RootScreen()));
            },
            child: Container(
              width: 300,
              height: 55,
              decoration: BoxDecoration(
                  color: ColorConstant.primaryColor,
                  borderRadius: BorderRadius.circular(40)),
              child: Center(
                  child: Text(
                "Allow Location Access",
                style: TextStyle(color: Colors.white, fontSize: 17),
              )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchLocation()));
            },
            child: Text(
              "Enter location manually?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
