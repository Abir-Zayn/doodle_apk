import 'dart:convert';
import 'package:doodle_apk_test/page/Detailed/model/restaurant_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://demo-api.devdata.top/api/RestaurantInfo/GetRestaurantInfo";

  Future<RestaurantInfo?> fetchRestaurantInfo() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 200) {
          return RestaurantInfo.fromJson(data['data']);
        } else {
          debugPrint("Error: ${data['message']}");
        }
      } else {
        debugPrint("HTTP Error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Exception: $e");
    }
    return null; // Return null if there's an error
  }
}
