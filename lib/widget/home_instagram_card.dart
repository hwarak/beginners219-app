import 'package:flutter/material.dart';
import '../const/button_style.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

class HomeInstagramCard extends StatelessWidget {
  final int index;
  const HomeInstagramCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 170.0,
        child: ElevatedButton(
          onPressed: _launchUrl,
          child: Text(
            'Insta $index',
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

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
