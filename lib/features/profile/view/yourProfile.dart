import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_cruise/features/profile/view/create_profile.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class YourProfile extends StatefulWidget {
  const YourProfile({super.key});

  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  late CollectionReference users;
  @override
  void initState() {
    super.initState();
    users = FirebaseFirestore.instance.collection('users');
    getUid();
  }

  XFile? selectedImage;

  Future<void> getUserProfile(String uid) async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (documentSnapshot.exists) {
      var data = documentSnapshot.data();
      print(data);
    }
  }

  String? uid;

  getUid() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = await prefs.getString('uid');
  }

  @override
  Widget build(BuildContext context) {
    getUserProfile(uid ?? '');
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
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        title: Text(
          "Your Profile",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          TextButton(
              onPressed: () {
                //
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CreateProfile()));
              },
              child: Text(
                "Edit",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      // body: StreamBuilder(
      //     stream: users.snapshots(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         DocumentSnapshot data = snapshot.data!.docs[0];
      //         return Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Stack(
      //                 children: [
      //                   Container(
      //                     width: double.infinity,
      //                     height: 260,
      //                     color: Colors.white,
      //                   ),
      //                   Container(
      //                     height: 180,
      //                     width: double.infinity,
      //                     decoration: BoxDecoration(
      //                         color: Colors.grey[300],
      //                         borderRadius: BorderRadius.only(
      //                             bottomLeft: Radius.circular(70),
      //                             bottomRight: Radius.circular(70))),
      //                   ),
      //                   Positioned(
      //                     left: 25,
      //                     right: 25,
      //                     top: 70,
      //                     child: Container(
      //                       width: 300,
      //                       height: 180,
      //                       decoration: BoxDecoration(
      //                           color: ColorConstant.primaryColor,
      //                           borderRadius: BorderRadius.circular(20)),
      //                       child: Column(
      //                         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                         children: [
      //                           SizedBox(
      //                             height: 60,
      //                           ),
      //                           Text(
      //                             "${data['name']}",
      //                             style: TextStyle(
      //                                 color: Colors.white,
      //                                 fontSize: 20,
      //                                 fontWeight: FontWeight.bold),
      //                           ),
      //                           SizedBox(
      //                             height: 5,
      //                           ),
      //                           Text(
      //                             "${data['mobile_number']}",
      //                             style: TextStyle(
      //                                 color: Colors.white,
      //                                 fontSize: 15,
      //                                 fontWeight: FontWeight.bold),
      //                           ),
      //                           SizedBox(
      //                             height: 5,
      //                           ),
      //                           Text(
      //                             "${data['email']}",
      //                             style: TextStyle(
      //                                 color: Colors.white,
      //                                 fontSize: 15,
      //                                 fontWeight: FontWeight.bold),
      //                           ),
      //                           SizedBox(
      //                             height: 5,
      //                           ),
      //                           Text(
      //                             "${data['address']}",
      //                             style: TextStyle(
      //                                 color: Colors.white,
      //                                 fontSize: 15,
      //                                 fontWeight: FontWeight.bold),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                   Positioned(
      //                     left: 0,
      //                     right: 0,
      //                     top: 20,
      //                     child: Column(
      //                       children: [
      //                         CircleAvatar(
      //                           backgroundImage: NetworkImage(
      //                               "https://imgs.search.brave.com/bHpTjt49BE6IN6GPjmIm4FaNZXFj4xFH3ey8KXtPew0/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/dzNzY2hvb2xzLmNv/bS9ob3d0by9pbWdf/YXZhdGFyLnBuZw"),
      //                           radius: 50,
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.symmetric(horizontal: 5),
      //                 child: Row(
      //                   children: [
      //                     Expanded(
      //                       child: Container(
      //                         margin: EdgeInsets.symmetric(horizontal: 5),
      //                         height: 60,
      //                         decoration: BoxDecoration(
      //                           border: Border.all(color: Colors.grey.shade400),
      //                           color: Colors.grey[200],
      //                           borderRadius: BorderRadius.circular(10),
      //                         ),
      //                         child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.center,
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             children: [
      //                               Text(
      //                                 "Rent Out",
      //                                 style: TextStyle(
      //                                     fontSize: 18,
      //                                     fontWeight: FontWeight.bold),
      //                               ),
      //                               SizedBox(
      //                                 height: 5,
      //                               ),
      //                               Text("4",
      //                                   style: TextStyle(
      //                                       fontStyle: FontStyle.italic,
      //                                       fontSize: 15,
      //                                       fontWeight: FontWeight.bold)),
      //                             ]),
      //                       ),
      //                     ),
      //                     Expanded(
      //                       child: Container(
      //                         margin: EdgeInsets.symmetric(horizontal: 5),
      //                         height: 60,
      //                         decoration: BoxDecoration(
      //                             border:
      //                                 Border.all(color: Colors.grey.shade400),
      //                             color: Colors.grey[200],
      //                             borderRadius: BorderRadius.circular(10)),
      //                         child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.center,
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             children: [
      //                               Text(
      //                                 "Bookings",
      //                                 style: TextStyle(
      //                                     fontSize: 18,
      //                                     fontWeight: FontWeight.bold),
      //                               ),
      //                               SizedBox(
      //                                 height: 5,
      //                               ),
      //                               Text(
      //                                 "",
      //                                 style: TextStyle(
      //                                     fontStyle: FontStyle.italic,
      //                                     fontSize: 15,
      //                                     fontWeight: FontWeight.bold),
      //                               ),
      //                             ]),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 20,
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 20, right: 20),
      //                 child: Row(
      //                   children: [
      //                     Text(
      //                       "My Location",
      //                       style: TextStyle(
      //                           fontSize: 20,
      //                           color: Colors.black,
      //                           fontWeight: FontWeight.bold),
      //                     ),
      //                     Spacer(),
      //                     Text(
      //                       "Specify location",
      //                       style: TextStyle(
      //                           fontSize: 14, color: Colors.grey[700]),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               //map,

      //               SizedBox(
      //                 height: 20,
      //               ),
      //               GestureDetector(
      //                 onTap: () {
      //                   //
      //                   final url = Uri.parse(
      //                       'https://www.google.com/maps/@9.9894452,76.2979403,15z/data=!5m1!1e1?entry=ttu');
      //                   print(url);
      //                   launchUrl(url);
      //                 },
      //                 child: Center(
      //                   child: Container(
      //                     margin: EdgeInsets.only(left: 15, right: 15),
      //                     height: 190,
      //                     decoration: BoxDecoration(
      //                         color: Colors.grey,
      //                         borderRadius: BorderRadius.circular(20)),
      //                     child: ClipRRect(
      //                         borderRadius: BorderRadius.circular(20),
      //                         child: Image.asset("assets/images/map.png")),
      //                   ),
      //                 ),
      //               )
      //             ]);
      //       }

      //       return Text("loading");
      //     }),
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
