import 'package:flutter/material.dart';
import 'package:rent_cruise/search_screen/search_result_screen/search_card/search_card.dart';

class search_result_screen extends StatefulWidget {
  const search_result_screen({super.key});

  @override
  State<search_result_screen> createState() => _search_result_screenState();
}

class _search_result_screenState extends State<search_result_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Search",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: SearchBar(hintText: "Search"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 230, crossAxisCount: 2),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return search_card();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
