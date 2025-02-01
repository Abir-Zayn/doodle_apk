import 'dart:convert';

class Restaurant {
  final String restaurantImg;
  final String restaurantName;
  final double star;
  final String deliveryTime;
  final String cookingTime;

  Restaurant({
    required this.restaurantImg,
    required this.restaurantName,
    required this.star,
    required this.deliveryTime,
    required this.cookingTime,
  });

  // Factory constructor to create a Restaurant object from a JSON map
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      restaurantImg: json['restaurant_img'],
      restaurantName: json['restaurant_name'],
      star: (json['star'] as num).toDouble(), // Handle int or double from JSON
      deliveryTime: json['delivery_time'],
      cookingTime: json['cooking_time'],
    );
  }

  // Method to convert a Restaurant object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'restaurant_img': restaurantImg,
      'restaurant_name': restaurantName,
      'star': star,
      'delivery_time': deliveryTime,
      'cooking_time': cookingTime,
    };
  }

  // Method to convert a Restaurant object to a JSON string
  String toJsonString() {
    return jsonEncode(toJson());
  }

  // Factory constructor to create a list of Restaurant objects from a JSON string
  static List<Restaurant> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString) as List;
    return jsonList.map((json) => Restaurant.fromJson(json)).toList();
  }
}
