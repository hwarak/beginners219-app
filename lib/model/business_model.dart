import 'dart:ui';

class BusinessModel {
  final int business_id;
  final String business_title;
  final String business_address;
  final int business_category_id;
  final String business_hours_weekdays;
  final String business_hours_holiday;
  final String business_hours_notice;
  final String business_insta_url;
  final String business_blog_url;
  final String business_hompage_url;
  final String business_phone_number;
  final double business_longitude;
  final double business_latitude;

  BusinessModel(
      {required this.business_id,
      required this.business_title,
      required this.business_address,
      required this.business_category_id,
      required this.business_hours_weekdays,
      required this.business_hours_holiday,
      required this.business_hours_notice,
      required this.business_insta_url,
      required this.business_blog_url,
      required this.business_hompage_url,
      required this.business_phone_number,
      required this.business_longitude,
      required this.business_latitude});

  // Json으로부터 데이터를 받아온다
  BusinessModel.fromJson({required Map<String, dynamic> json})
      : business_id = json['business_id'],
        business_title = json['business_title'],
        business_address = json['business_address'],
        business_category_id = json['business_category_id'],
        business_hours_weekdays = json['business_hours_weekdays'],
        business_hours_holiday = json['business_hours_holiday'],
        business_hours_notice = json['business_hours_notice'],
        business_insta_url = json['business_insta_url'],
        business_blog_url = json['business_blog_url'],
        business_hompage_url = json['business_hompage_url'],
        business_phone_number = json['business_phone_number'],
        business_longitude = json['business_longitude'],
        business_latitude = json['business_latitude'];
}
