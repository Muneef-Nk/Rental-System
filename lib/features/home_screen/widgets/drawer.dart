import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_cruise/features/authentication/view/login_scrren.dart';
import 'package:rent_cruise/features/favourite_screen/view/favourite_screen.dart';
import 'package:rent_cruise/features/profile/view/yourProfile.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerSession extends StatefulWidget {
  const DrawerSession({
    super.key,
  });

  @override
  State<DrawerSession> createState() => _DrawerSessionState();
}

class _DrawerSessionState extends State<DrawerSession> {
  @override
  void initState() {
    getUid();
    super.initState();
  }

  String? uid;

  Future<void> getUid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = prefs.getString('uid');
    });
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            FutureBuilder(
                future: users.doc(uid).get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(data?['image']),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${data?['name']}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${data?['email']}',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              "https://imgs.search.brave.com/bHpTjt49BE6IN6GPjmIm4FaNZXFj4xFH3ey8KXtPew0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/dzNzY2hvb2xzLmNv/bS9ob3d0by9pbWdf/YXZhdGFyLnBuZw"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Unknown',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "xxxx@gmail.com",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FavouriteScreeen()));
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.sell_outlined,
                      color: ColorConstant.primaryColor,
                    ),
                    title: Text("My Products"),
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
                      final String whatsappLink = "https://your-link-here.com";
                      Share.share("Check out this link: $whatsappLink",
                          subject: "Share Link");
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
        ));
  }
}
