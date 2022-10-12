import 'package:flutter/material.dart';

import '../widget/article_card.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // reverse: true,
      children: [
        for (int i = 5; i >= 0; i--)
          ArticleCard(
            title: "Title $i",
            subTitle: "SubTitle $i",
            content: "Contents $i",
          ),
      ],
    );
  }
}
