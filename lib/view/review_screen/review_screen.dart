import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  TextEditingController reviewcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop()),
        title: Text(
          "Leave Review",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Center(
                    child: Text(
                      "Cancel",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 208, 206, 206),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: ColorConstant.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 90,
                    width: 90,
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
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "DSLR Camera",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "400 Rs./day",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorConstant.primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Center(
                        child: Text(
                          "Re-Order",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 0.2,
            indent: 20,
            endIndent: 20,
          ),
          Center(
            child: Text(
              'How is Your Order?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          Center(
              child: Text(
            "Your Overall rating",
            style: TextStyle(color: const Color.fromARGB(255, 188, 187, 187)),
          )),
          SizedBox(height: 8),
          Center(child: _buildRatingBar()),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Add Detailed Review',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * .15,
              child: TextFormField(
                cursorColor: Colors.black,

                controller: reviewcontroller,
                maxLines: null,
                expands: true,
                // minLines: 1,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    hintText: "Enter Here",
                    labelText: "Enter Here",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildRatingBar() {
  return RatingBar.builder(
    initialRating: 3,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemSize: 40.0,
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: Colors.amber,
    ),
    onRatingUpdate: (rating) {
      // Handle the rating update
    },
  );
}
