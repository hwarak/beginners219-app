import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'layout/default_layout.dart';

void main() async {
  await dotenv.load(fileName: 'assets/config/.env');
  runApp(MaterialApp(
    home: DefaultLayout(),
    debugShowCheckedModeBanner: false,
  ));
}
