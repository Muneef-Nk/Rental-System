import 'package:flutter/material.dart';
import 'package:rent_cruise/utils/color_constant.dart/color_constant.dart';

class SearchLocation extends StatelessWidget {
  SearchLocation({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Enter your location",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            margin: EdgeInsets.all(5),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300)),
            child: Icon(
              Icons.arrow_back,
              color: ColorConstant.primaryColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: TextField(
              autofocus: true,
              controller: _searchController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  hintText: "Search",
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // Provider.of<SearchController>(context, listen: false)
                      //     .addSearchData();
                    },
                    child: Icon(
                      Icons.search,
                      color: ColorConstant.primaryColor,
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => BottomNav()));
            },
            child: ListTile(
              leading: Icon(Icons.near_me, color: ColorConstant.primaryColor),
              title: Text("Use my current location"),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "search Result",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          SizedBox(
            child: ListView.builder(
                itemCount: 1,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      Icons.near_me,
                      color: ColorConstant.primaryColor,
                    ),
                    title: Text("kochi"),
                    trailing: Icon(Icons.close),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
