import 'package:doodle_apk_test/page/Cart/widget/cart_item_card.dart';
import 'package:doodle_apk_test/page/Cart/widget/placed_order.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showAlert(BuildContext context) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return PlacedOrder(onHomePressed: () {
              context.go('/home');
            });
          });
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Your Order',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            context.go('/home');
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  // Restaurant Info Card
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://via.placeholder.com/60'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pizza House',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Delivery in 30-35 min',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Order Items
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        CartItemCard(
                            name: 'Margherita Pizza',
                            quantity: '2',
                            price: 'AED 12.99',
                            description:
                                "Classic pizza with tomato sauce, mozzarella cheese, and fresh basil."),
                        CartItemCard(
                            name: 'Pepperoni Pizza',
                            quantity: '1',
                            price: 'AED 15.99',
                            description:
                                "Classic pizza with tomato sauce, mozzarella cheese, and pepperoni."),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Bill Details
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        CartItemCard(
                            name: 'Margherita Pizza',
                            quantity: '2',
                            price: 'AED 12.99',
                            description:
                                "Classic pizza with tomato sauce, mozzarella cheese, and fresh basil.")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Button
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0, -4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                showAlert(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink.shade700,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Place Order • \$38.95',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
