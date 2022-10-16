import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  const HomeTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      child: Stack(
        children: [
          Positioned(
            top: 17.0,
            child: Image.asset(
              "assets/images/home_title_underline.jpg",
              width: title == "Main Article"
                  ? MediaQuery.of(context).size.width / 3
                  : MediaQuery.of(context).size.width / 2,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
