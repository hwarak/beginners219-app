import 'package:flutter/material.dart';
import '../const/button_style.dart';

class HomeShopCard extends StatelessWidget {
  const HomeShopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 113,
      child: InkWell(
        onTap: () {},
        child: Ink.image(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/go_search.png"),
        ),
      ),
    );
  }
}
