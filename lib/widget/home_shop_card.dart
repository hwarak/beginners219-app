import 'package:flutter/material.dart';
import '../const/button_style.dart';

class HomeShopCard extends StatelessWidget {
  const HomeShopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          "주변 웨이스트샵 보러가기 ->",
          style: TextStyle(
            fontSize: 18.0,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        style: mainElevatedButtonStyle,
      ),
    );
  }
}
