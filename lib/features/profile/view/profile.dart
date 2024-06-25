import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_cruise/features/authentication/view/login_scrren.dart';
import 'package:rent_cruise/features/profile/view/yourProfile.dart';
import 'package:rent_cruise/shared/pages/payment_methods_screen/payment_methods_screen.dart';
import 'package:rent_cruise/view/Profile/helpCenter.dart';
import 'package:rent_cruise/view/Profile/privacy.dart';
import 'package:rent_cruise/view/Profile/settings.dart';

import 'package:share_plus/share_plus.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, this.isBack = false});
  final bool isBack;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              widget.isBack ? Navigator.of(context).pop() : SizedBox();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
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
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.15,
                          width: MediaQuery.sizeOf(context).width * 0.3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: selectedImage != null
                                  ? FileImage(File(selectedImage!.path))
                                      as ImageProvider<Object>
                                  : NetworkImage(
                                      "https://imgs.search.brave.com/bHpTjt49BE6IN6GPjmIm4FaNZXFj4xFH3ey8KXtPew0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/dzNzY2hvb2xzLmNv/bS9ob3d0by9pbWdf/YXZhdGFyLnBuZw"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Muneef",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => order_screen()));
                      },
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward),
                        title: Text("My Orders"),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Settings(),
                            ));
                      },
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward),
                        title: Text("Settings"),
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 179, 238, 112),
                          ),
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.settings,
                            size: 18,
                            color: Colors.white,
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
                              builder: (context) => HelpCenter(),
                            ));
                      },
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward),
                        title: Text("Help Center"),
                        leading: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber),
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.help,
                            size: 18,
                            color: Colors.white,
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
                              builder: (context) => PrivacyPolicy(),
                            ));
                      },
                      child: ListTile(
                        trailing: Icon(Icons.arrow_forward),
                        title: Text("Privacy Policy"),
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 91, 232, 150),
                          ),
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.lock,
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
                        await FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (route) => false);
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

  Future<void> pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = XFile(pickedImage.path);
      });
    }
  }
}
