import 'dart:convert';

class FoodInfoConvert {
  final String foodName;
  final double foodPrice;
  final String foodDescription;
  final double foodRating;
  final String foodPicture;
  final bool hasVariant;
  final String foodImg;
  final String category;

  FoodInfoConvert({
    required this.foodName,
    required this.foodPrice,
    required this.foodDescription,
    required this.foodRating,
    required this.foodPicture,
    required this.hasVariant,
    required this.foodImg,
    required this.category,
  });

  // Factory method to create a FoodItem from JSON
  factory FoodInfoConvert.fromJson(Map<String, dynamic> json) {
    return FoodInfoConvert(
      foodName: json['foodName'] ?? '',
      foodPrice: json['foodPrice'] ?? 0.0,
      foodDescription: json['foodDescription'] ?? '',
      foodRating: json['foodRating'] ?? 0.0,
      foodPicture: json['foodPicture'] ?? '',
      hasVariant: json['hasVariant'] ?? false,
      foodImg: json['foodImg'] ?? '',
      category: json['category'] ?? '',
    );
  }

  // Method to convert a FoodItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'foodName': foodName,
      'foodPrice': foodPrice,
      'foodDescription': foodDescription,
      'foodRating': foodRating,
      'foodPicture': foodPicture,
      'hasVariant': hasVariant,
      'foodImg': foodImg,
      'category': category,
    };
  }

  // Method to convert a FoodItem to a JSON string
  String toJsonString() {
    return jsonEncode(toJson());
  }

  // Factory method to create a list of FoodItems from a JSON string
  static List<FoodInfoConvert> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString) as List;
    return jsonList.map((json) => FoodInfoConvert.fromJson(json)).toList();
  }
}
