import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

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
  Future<List<BusinessModel>> fetchData() async {
    final businessModels = await BusinesssRepository.fetchData();
    return businessModels;
  }

  static final LatLng startPosition = LatLng(
    37.5649,
    126.9205,
  );

  static final CameraPosition initialPosition = CameraPosition(
    target: startPosition,
    zoom: 16,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkPermission(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.data == '위치 권한이 허가되었습니다') {
          return FutureBuilder<List<BusinessModel>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                // 에러가 있음
                return Center(
                  child: Text('에러가 있습니다'),
                );
              }

              if (!snapshot.hasData) {
                // 에러가 없는데 데이터가 없다 -> 로딩중
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              // 이때부터는 무조건 데이터가 있는 상태
              List<BusinessModel> list = snapshot.data!;

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
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      initialCameraPosition: initialPosition,
                      markers: list
                          .map(
                            (e) => Marker(
                              markerId: MarkerId(e.business_title),
                              position: LatLng(
                                  e.business_latitude, e.business_longitude),
                              icon: e.business_category_id == 1
                                  ? BitmapDescriptor.defaultMarkerWithHue(
                                      BitmapDescriptor.hueViolet)
                                  : BitmapDescriptor.defaultMarkerWithHue(
                                      BitmapDescriptor.hueBlue),
                            ),
                          )
                          .toSet(),
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
                          for (int i = 0; i < list.length; i++)
                            ShopList(
                              business: list[i],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }

        return Center(
          child: Text(snapshot.data),
        );
      },
    );
  }

  Future<String> checkPermission() async {
    final isLocationenabled =
        await Geolocator.isLocationServiceEnabled(); // location 서비스 활성화 되어있니?

    if (!isLocationenabled) return '위치 서비스를 활성화 해주세요';

    LocationPermission checkedPermission =
        await Geolocator.checkPermission(); // 현재 위치 권한 확인

    if (checkedPermission == LocationPermission.denied) {
      checkedPermission = await Geolocator.requestPermission(); // 권한 요청

      if (checkedPermission == LocationPermission.denied)
        return "위치 권한을 허가해주세요";
    }

    if (checkedPermission == LocationPermission.deniedForever) {
      return "설정에서 위치 권한을 허가해주세요";
    }

    return '위치 권한이 허가되었습니다';
  }
}
