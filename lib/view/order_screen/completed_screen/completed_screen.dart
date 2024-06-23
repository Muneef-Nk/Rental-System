import 'package:flutter/material.dart';
import 'package:rent_cruise/view/review_screen/review_screen.dart';

import '../../../utils/color_constant.dart/color_constant.dart';

class Completed_screen extends StatefulWidget {
  const Completed_screen({super.key});

  @override
  State<Completed_screen> createState() => _Completed_screenState();
}

class _Completed_screenState extends State<Completed_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Card(
          elevation: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: 100,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "https://i.pinimg.com/564x/a9/71/26/a9712669d443d3203ac074924d2afb71.jpg",
                      fit: BoxFit.cover,
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DSLR Camera",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "400/day",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey[800]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "2 weeks ago",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ],
              ),
              Positioned(
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ReviewScreen()));
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorConstant.primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Center(
                        child: Text(
                          "Leave Review",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
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
