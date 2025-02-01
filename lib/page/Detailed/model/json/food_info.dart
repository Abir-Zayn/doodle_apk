class JsonFoodInfo {
  String jsonData = '''
[
  {
    "category": "Pizza",
    "foodName": "Margherita Pizza",
    "foodPrice": 12.99,
    "foodDescription": "Classic pizza with tomato sauce, mozzarella cheese, and fresh basil.",
    "foodRating": 4.5,
    "hasVariant": false,
    "foodImg": "https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "category": "Pizza",
    "foodName": "BBQ Chicken Pizza",
    "foodPrice": 14.99,
    "foodDescription": "Grilled chicken with BBQ sauce, mozzarella, and onions.",
    "foodRating": 4.7,
    "hasVariant": true,
    "foodImg": "https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "category": "Platter",
    "foodName": "Tandoori Chicken Platter",
    "foodPrice": 16.99,
    "foodDescription": "Chargrilled chicken marinated in Indian spices, served with naan and chutney.",
    "foodRating": 4.8,
    "hasVariant": true,
    "foodImg": "https://images.unsplash.com/photo-1621291726769-86a0b3fc6357?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fFBsYXR0ZXJ8ZW58MHx8MHx8fDA%3D"
  },
  {
    "category": "Biriyani",
    "foodName": "Hyderabadi Chicken Biryani",
    "foodPrice": 16.99,
    "foodDescription": "Traditional Hyderabadi dum biryani with fragrant basmati rice and tender chicken.",
    "foodRating": 4.8,
    "hasVariant": true,
    "foodImg": "https://images.unsplash.com/photo-1589302168068-964664d93dc0?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "category": "Biriyani",
    "foodName": "Beef Biryani",
    "foodPrice": 19.99,
    "foodDescription": "Spicy and flavorful beef biryani with perfectly cooked rice.",
    "foodRating": 4.8,
    "hasVariant": true,
    "foodImg": "https://images.unsplash.com/photo-1589302168068-964664d93dc0?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "category": "Biriyani",
    "foodName": "Mutton Biryani",
    "foodPrice": 18.99,
    "foodDescription": "Aromatic basmati rice cooked with tender mutton and Indian spices.",
    "foodRating": 4.9,
    "hasVariant": true,
    "foodImg": "https://images.unsplash.com/photo-1589302168068-964664d93dc0?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "category": "Biriyani",
    "foodName": "Egg Biryani",
    "foodPrice": 14.49,
    "foodDescription": "Flavorful biryani made with boiled eggs and aromatic basmati rice.",
    "foodRating": 4.6,
    "hasVariant": true,
    "foodImg": "https://images.unsplash.com/photo-1589302168068-964664d93dc0?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "category": "Biriyani",
    "foodName": "Veg Biryani",
    "foodPrice": 13.99,
    "foodDescription": "Mixed vegetable biryani with aromatic spices and basmati rice.",
    "foodRating": 4.4,
    "hasVariant": true,
    "foodImg": "https://images.unsplash.com/photo-1589302168068-964664d93dc0?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "category": "Biriyani",
    "foodName": "Dum Biryani",
    "foodPrice": 18.99,
    "foodDescription": "Slow-cooked biryani with layers of marinated meat and fragrant rice.",
    "foodRating": 4.9,
    "hasVariant": true,
    "foodImg": "https://images.unsplash.com/photo-1589302168068-964664d93dc0?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
   {
    "category": "Desserts",
    "foodName": "Rasmalai",
    "foodPrice": 7.99,
    "foodDescription": "Soft cottage cheese dumplings soaked in sweet, flavored milk.",
    "foodRating": 4.7,
    "hasVariant": false,
    "foodImg": "https://images.unsplash.com/photo-1563805042-7684c019e1cb?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "category": "Desserts",
    "foodName": "Jalebi",
    "foodPrice": 5.99,
    "foodDescription": "Crispy, deep-fried spiral sweets soaked in saffron-flavored sugar syrup.",
    "foodRating": 4.7,
    "hasVariant": false,
    "foodImg": "https://images.unsplash.com/photo-1563805042-7684c019e1cb?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "category": "Desserts",
    "foodName": "Kheer",
    "foodPrice": 6.49,
    "foodDescription": "A rich and creamy Indian rice pudding made with milk, sugar, and nuts.",
    "foodRating": 4.6,
    "hasVariant": false,
    "foodImg": "https://images.unsplash.com/photo-1563805042-7684c019e1cb?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  }, {
    "category": "Desserts",
    "foodName": "Mango Kulfi",
    "foodPrice": 6.99,
    "foodDescription": "Traditional Indian frozen dessert made with condensed milk and mango pulp.",
    "foodRating": 4.9,
    "hasVariant": false,
    "foodImg": "https://images.unsplash.com/photo-1563805042-7684c019e1cb?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "category": "Desserts",
    "foodName": "Malpua",
    "foodPrice": 7.29,
    "foodDescription": "Indian-style pancakes soaked in sugar syrup, served with rabri.",
    "foodRating": 4.7,
    "hasVariant": false,
    "foodImg": "https://images.unsplash.com/photo-1563805042-7684c019e1cb?q=80&w=2127&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "category": "Drinks",
    "foodName": "Masala Chai",
    "foodPrice": 4.99,
    "foodDescription": "Spiced Indian tea brewed with milk and aromatic spices.",
    "foodRating": 4.8,
    "hasVariant": false,
    "foodImg": "https://images.unsplash.com/photo-1497534446932-c925b458314e?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  }
]
''';
}
