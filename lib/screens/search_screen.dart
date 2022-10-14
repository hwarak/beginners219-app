import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/business_model.dart';
import '../repository/business_repository.dart';
import '../widget/search_bar.dart';
import '../widget/shop_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  BusinessModel? tempModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    final businessModels = await BusinesssRepository.fetchData();
    setState(() {
      tempModel = businessModels[0];
    });
  }

  static final LatLng startPosition = LatLng(
    37.53666612,
    126.9990948,
  );

  static final CameraPosition initialPosition = CameraPosition(
    target: startPosition,
    zoom: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: SearchBar(),
          ),
        ),
        Expanded(
          flex: 5,
          child: GoogleMap(
            initialCameraPosition: initialPosition,
            // markers: shops
            //     .map(
            //       (e) => Marker(
            //           markerId: MarkerId(e.businessName),
            //           position: LatLng(e.latitude, e.longitude)),
            //     )
            //     .toSet(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            // color: Colors.blueAccent,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  topLeft: Radius.circular(12.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "내 위치 중심",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                if (tempModel != null)
                  for (int i = 0; i < 5; i++)
                    ShopList(
                      business: tempModel!,
                    ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
