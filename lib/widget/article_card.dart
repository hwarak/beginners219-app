import 'package:flutter/material.dart';

import '../screens/article_contents_screen.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String content;
  const ArticleCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        color: Color.fromARGB(255, 222, 222, 222),
        child: InkWell(
          splashColor: colorScheme.onSurface.withOpacity(0.12),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArticleContentsScreen(title: title)));
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                child: Image.asset(
                  "assets/images/img01.jpg",
                  // height: 100.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22.0),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        content,
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
