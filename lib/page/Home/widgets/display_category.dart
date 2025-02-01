import 'package:doodle_apk_test/page/Home/models/category_model.dart';
import 'package:flutter/material.dart';

class DisplayCategory extends StatelessWidget {
  const DisplayCategory({super.key});

  // Helper function to get the display name for each category
  String getCategoryName(CategoryModel category) {
    switch (category) {
      case CategoryModel.all:
        return 'All';
      case CategoryModel.burger:
        return 'Burger';
      case CategoryModel.pizza:
        return 'Pizza';
      case CategoryModel.drinks:
        return 'Drinks';
      case CategoryModel.desserts:
        return 'Desserts';
      case CategoryModel.biriyani:
        return 'Biriyani';
      case CategoryModel.platter:
        return 'Platter';
    }
  }

  // Helper function to get an icon for each category (optional)
  IconData getCategoryIcon(CategoryModel category) {
    switch (category) {
      case CategoryModel.all:
        return Icons.all_inclusive;
      case CategoryModel.burger:
        return Icons.fastfood;
      case CategoryModel.pizza:
        return Icons.local_pizza;
      case CategoryModel.drinks:
        return Icons.local_drink;
      case CategoryModel.desserts:
        return Icons.cake;
      case CategoryModel.biriyani:
        return Icons.rice_bowl;
      case CategoryModel.platter:
        return Icons.dinner_dining;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Convert enum values to a list
    final categories = CategoryModel.values;

    return SizedBox(
      height: 100, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              // Handle category tap (e.g., navigate to a new screen or filter items)
              debugPrint('Selected Category: ${getCategoryName(category)}');
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              width: 100, // Adjust width as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon for the category
                  Icon(
                    getCategoryIcon(category),
                    size: 20,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 8),
                  // Category name
                  Text(
                    getCategoryName(category),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
