import 'package:flutter/material.dart';

class ArticleContentsScreen extends StatelessWidget {
  final String title;
  const ArticleContentsScreen({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/img01.jpg",
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "네가 참 궁금해 그건 너도 마찬가지-이거면 충분해 쫓고 쫓는 이런 놀이-참을 수 없는 이끌림과 호기심-묘한 너와 나 두고 보면 알겠지-Woo 눈동자 아래로 Woo 감추고 있는 거 Woo yeah It's so bad It's good-난 그 맘을 좀 봐야겠어 Narcissistic my god I love it-서로를 비춘 밤 아름다운 까만 눈빛 더 빠져 깊이-(넌 내게로 난 네게로) 숨 참고 love dive-Woo lalalalalalala-Woo 어서 와서 love dive-Woo oh perfect sacrifice yeah-숨 참고 love dive-마음은 이렇게 알다가도 모르지-사랑이라는 건 한순간에 필 테니-직접 들어와 두 눈으로 확인해-내 맘 가장 깊은 데로 오면 돼-Woo 망설일 시간은 Woo 3초면 되는 걸 Woo yeah It's so bad It's good-원하면 감히 뛰어들어 Narcissistic my god I love it-서로를 비춘 밤 아름다운 까만 눈빛 더 빠져 깊이-(넌 내게로 난 네게로) 숨 참고 love dive-Woo lalalalalalala-Woo 어서 와서 love dive-Woo oh perfect sacrifice yeah-숨 참고 love dive-숨 참고 love dive-숨 참고 love dive-숨 참고 love dive-숨 참고 love dive-Woo lalalalalalala-Woo 어서 와서 love dive-Woo oh perfect sacrifice yeah-숨 참고 love dive",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
