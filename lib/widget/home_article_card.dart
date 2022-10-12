import 'package:flutter/material.dart';

import '../const/button_style.dart';

class HomeArticleCard extends StatelessWidget {
  final int index;
  const HomeArticleCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 100.0,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Article $index',
            style: TextStyle(
              fontSize: 18.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          style: mainElevatedButtonStyle,
        ),
      ),
    );
  }
}
