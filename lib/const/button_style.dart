import 'package:flutter/material.dart';

ButtonStyle mainElevatedButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
  ),
  backgroundColor:
      MaterialStateProperty.all<Color>(Color.fromARGB(255, 222, 222, 222)),
);
