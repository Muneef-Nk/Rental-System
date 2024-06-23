import 'package:flutter/material.dart';

import '../../../utils/color_constant.dart/color_constant.dart';

class active_screen extends StatefulWidget {
  const active_screen({super.key});

  @override
  State<active_screen> createState() => _active_screenState();
}

class _active_screenState extends State<active_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Card(
          elevation: 1,
          borderOnForeground: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(35)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        "https://i.pinimg.com/564x/49/54/c8/4954c88ff4aadb23137332c8733ba79d.jpg",
                        fit: BoxFit.cover,
                      ),
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
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey[800]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "4 days left",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => ProductDetailsScreen(
                    //           index: 0,
                    //           dataList: [],
                    //         )));
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
                          "View Details",
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
