import 'package:flutter/material.dart';

class SocialContainer extends StatelessWidget {
  final String image;
  const SocialContainer({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
      child: Image.asset(
        image,
      ),
    );
  }
}
