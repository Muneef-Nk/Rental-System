import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SavedProductLoading extends StatelessWidget {
  const SavedProductLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(9),
        child: GridView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              mainAxisExtent: MediaQuery.sizeOf(context).height * .3,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Shimmer.fromColors(
                          baseColor: Color.fromARGB(255, 233, 233, 233),
                          highlightColor: Colors.white,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                          ),
                        )),
                    SizedBox(height: 10),
                    Shimmer.fromColors(
                      baseColor: Color.fromARGB(255, 233, 233, 233),
                      highlightColor: Colors.white,
                      child: Container(
                        width: double.infinity,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Shimmer.fromColors(
                            baseColor: Color.fromARGB(255, 233, 233, 233),
                            highlightColor: Colors.white,
                            child: Container(
                              // width: 100,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Shimmer.fromColors(
                            baseColor: Color.fromARGB(255, 233, 233, 233),
                            highlightColor: Colors.white,
                            child: Container(
                              // width: 100,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Shimmer.fromColors(
                      baseColor: Color.fromARGB(255, 233, 233, 233),
                      highlightColor: Colors.white,
                      child: Container(
                        width: double.infinity,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ));
  }
}
