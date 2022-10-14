import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as foundation;

import '../model/business_model.dart';

bool get isiOS =>
    foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS;

class BusinesssRepository {
  static Future<List<BusinessModel>> fetchData() async {
    String username = 'user';
    String password = ‘password’;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    final response = await Dio().get(
      isiOS
          ? "http://localhost:8080/business"
          : "http://10.0.2.2:8080/business",
      queryParameters: {'startNum': 0},
      options: Options(headers: <String, String>{'authorization': basicAuth}),
    );

    return response.data['data']
        .map<BusinessModel>((item) => BusinessModel.fromJson(json: item))
        .toList();
  }
}
