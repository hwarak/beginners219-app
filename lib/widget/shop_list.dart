import 'package:flutter/material.dart';

import '../model/business_model.dart';

class ShopList extends StatelessWidget {
  final BusinessModel business;
  const ShopList({Key? key, required this.business}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80.0,
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset('assets/images/img02.jpg'),
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            flex: 5,
            child: SizedBox(
              height: 80.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    business.business_title,
                    style: TextStyle(fontSize: 17.0),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("영업 중"),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text("30M"),
          ),
        ],
      ),
    );
  }
}
