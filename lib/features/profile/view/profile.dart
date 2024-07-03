import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_cruise/features/authentication/view/login_scrren.dart';
import 'package:rent_cruise/features/my_products/view/my_products.dart';
import 'package:rent_cruise/features/profile/view/yourProfile.dart';
import 'package:rent_cruise/features/Payment_screen/payment_methods_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, this.isBack = false});
  final bool isBack;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Stack(
                      children: [
                        FutureBuilder<DocumentSnapshot>(
                          future: users.doc(uid).get(),
                          builder: (context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            }
                            if (!snapshot.hasData || !snapshot.data!.exists) {
                              // Handle case where document does not exist
                              return Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://imgs.search.brave.com/bHpTjt49BE6IN6GPjmIm4FaNZXFj4xFH3ey8KXtPew0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/dzNzY2hvb2xzLmNv/bS9ob3d0by9pbWdf/YXZhdGFyLnBuZw"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Unknown",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }
                            // Document exists, check if 'image' field exists
                            var imageUrl = snapshot.data!.get('image');
                            if (imageUrl != null && imageUrl.isNotEmpty) {
                              return Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(imageUrl),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          "${snapshot.data?['name']}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            } else {
                              // Handle case where 'image' field is empty or null
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "https://imgs.search.brave.com/bHpTjt49BE6IN6GPjmIm4FaNZXFj4xFH3ey8KXtPew0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/dzNzY2hvb2xzLmNv/bS9ob3d0by9pbWdf/YXZhdGFyLnBuZw"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => YourProfile(),
                          ),
                        );
                      },
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward),
                        title: Text("My Profile"),
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 238, 112, 217),
                          ),
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentMethods(),
                            ));
                      },
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward),
                        title: Text("Payment Method"),
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 215, 85, 48)),
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.payment,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyProductsScreeen()));
                      },
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward),
                        title: Text("My Products"),
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 112, 118, 238),
                          ),
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.tab,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        final String whatsappLink =
                            "https://your-link-here.com";
                        Share.share("Check out this link: $whatsappLink",
                            subject: "Share Link");
                      },
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward),
                        title: Text("Invites Friends"),
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 98, 187, 214),
                          ),
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.share,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () async {
                        await FirebaseAuth.instance
                            .signOut()
                            .then((value) async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool('isLogin', true);

                          return Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                        });
                      },
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward),
                        title: Text("Log Out"),
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 175, 112, 238),
                          ),
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.logout,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
