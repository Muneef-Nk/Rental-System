import 'package:flutter/material.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Notifications ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "TODAY",
                  style: TextStyle(
                    color: Color.fromARGB(255, 161, 159, 159),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Mark all as read",
                  style: TextStyle(color: ColorConstant.primaryColor),
                ),
              ),
            ],
          ),
          Divider(),
          ListTile(
            title: Row(
              children: [
                Text(
                  "Added New Products",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: ColorConstant.primaryColor),
                ),
                Spacer(),
                Text(
                  "1h",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 230, 226, 226),
              child: Icon(
                Icons.notification_add,
                color: ColorConstant.primaryColor,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Lorem ipsum dolor sit amet,non metus feugiat consequat., consectetur adipiscing elit.non metus feugiat consequat.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
