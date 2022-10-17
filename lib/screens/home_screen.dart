import 'package:flutter/material.dart';

import '../widget/home_article_card.dart';
import '../widget/home_instagram_card.dart';
import '../widget/home_shop_card.dart';
import '../widget/home_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          HomeShopCard(),
          SizedBox(
            height: 20.0,
          ),
          HomeTitle(title: "Instagram Article"),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int index = 1; index < 4; index++)
                  HomeInstagramCard(
                    index: index,
                  )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          HomeTitle(title: "Main Article"),
          SizedBox(
            height: 20.0,
          ),
          for (int index = 1; index < 5; index++)
            HomeArticleCard(
              index: index,
            ),
        ],
      ),
    );
  }
}
