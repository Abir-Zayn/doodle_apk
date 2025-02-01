import 'package:doodle_apk_test/common/env/api_service.dart';
import 'package:doodle_apk_test/common/widget/app_style.dart';
import 'package:doodle_apk_test/common/widget/app_textStyle.dart';
import 'package:doodle_apk_test/page/Detailed/model/food_info_convert.dart';
import 'package:doodle_apk_test/page/Detailed/model/json/food_info.dart';
import 'package:doodle_apk_test/page/Detailed/model/restaurant_info.dart';
import 'package:doodle_apk_test/page/Detailed/widgets/DeliveryTimeIndicator.dart';
import 'package:doodle_apk_test/page/Detailed/widgets/MenuCard.dart';
import 'package:doodle_apk_test/page/Detailed/widgets/Restaurant_order_snap.dart';
import 'package:doodle_apk_test/page/Detailed/widgets/Sliverappbar.dart';
import 'package:doodle_apk_test/page/Detailed/widgets/voucherCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RestaurantProfile extends StatefulWidget {
  const RestaurantProfile({super.key});

  @override
  State<RestaurantProfile> createState() => _RestaurantProfileState();
}

class _RestaurantProfileState extends State<RestaurantProfile>
    with SingleTickerProviderStateMixin {
  //fetch restaurant info
  late Future<RestaurantInfo?> restaurantInfo;
  //fetch food item
  final fetchfoodItem = JsonFoodInfo();
  //json data
  late String jsonData;
  //food item list
  late List<FoodInfoConvert> foodItemList;
  //scroll controller
  late ScrollController _scrollController;
  //categorie list
  late List<String> categories;
  late TabController _tabController;
  final Map<String, GlobalKey> _categoryKeys = {};

  @override
  void initState() {
    super.initState();
    jsonData = fetchfoodItem.jsonData;
    restaurantInfo = ApiService().fetchRestaurantInfo();
    foodItemList = FoodInfoConvert.fromJsonList(jsonData);
    categories = foodItemList.map((item) => item.category).toSet().toList();
    _scrollController = ScrollController();
    _tabController = TabController(length: categories.length, vsync: this);
    _scrollController.addListener(_onScroll);
  }

   void _onScroll() {
    final offset = _scrollController.offset;
    int newIndex = 0;

    // Calculate the current category based on scroll position
    for (int i = 0; i < categories.length; i++) {
      final category = categories[i];
      final key = _categoryKeys[category];
      if (key != null) {
        final context = key.currentContext;
        if (context != null) {
          final box = context.findRenderObject() as RenderBox;
          final categoryOffset = box.localToGlobal(Offset.zero).dy;
          if (categoryOffset <= offset + 100) { // Adjust the threshold as needed
            newIndex = i;
          }
        }
      }
    }

    // Update the selected tab if it has changed
    if (newIndex != _tabController.index) {
      _tabController.animateTo(newIndex);
    }
  }

  double _getCategoryOffset(int index) {
    final category = categories[index];
    final key = _categoryKeys[category];
    if (key != null) {
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        return box.localToGlobal(Offset.zero).dy;
      }
    }
    return 0.0;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        body: FutureBuilder<RestaurantInfo?>(
          future: restaurantInfo,
          builder: (context, snapshot) {
            //Error State
            if (snapshot.hasError) {
              return Center(
                child: AppTextstyle(
                  text: "Error: ${snapshot.error}",
                  style: appStyle(
                    size: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final data = snapshot.data;
              return CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    expandedHeight: 180.h,
                    floating: false,
                    pinned: true,
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.go('/home');
                      },
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border,
                            color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            data!.profileImageUrl,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.0, 0.5),
                                end: Alignment(0.0, 0.0),
                                colors: <Color>[
                                  Colors.black12,
                                  Colors.transparent
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Restaurant Name with Info Icon
                              Container(
                                padding: EdgeInsets.only(bottom: 5.h),
                                child: Row(
                                  children: [
                                    AppTextstyle(
                                      text: data.name,
                                      style: appStyle(
                                          size: 20.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    const Icon(
                                      Icons.info_outline,
                                      color: Colors.blueGrey,
                                    ),
                                  ],
                                ),
                              ),

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color:
                                            Color.fromARGB(255, 225, 112, 32),
                                      ),
                                      AppTextstyle(
                                        text: data.averageRating,
                                        style: appStyle(
                                            size: 14.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  AppTextstyle(
                                    text: "${data.totalRating} ratings",
                                    style: appStyle(
                                        size: 14.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),

                          // Delivery Time
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  DeliveryTimeIndicator(
                                    deliveryTime: data.averageDeliveryTime,
                                    icon: const Icon(Icons.timer),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  DeliveryTimeIndicator(
                                    deliveryTime: "${data.distance} away",
                                    icon: const Icon(Icons.location_on_rounded),
                                  ),
                                ],
                              ),
                              AppTextstyle(
                                text: "Review",
                                style: appStyle(
                                    size: 14.sp,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),

                          // Min Order, Free Delivery, More info
                          const RestaurantOrderSnap(),

                          // Voucher card
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                DiscountCard(
                                  discountAmount: "20% off",
                                  discountUpto: "upto 300 AED",
                                  colorStart: const Color(0xFF9C0140),
                                  colorEnd:
                                      const Color.fromARGB(255, 214, 151, 175),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                DiscountCard(
                                  discountAmount: "10% off",
                                  discountUpto: "upto 200 AED",
                                  colorStart:
                                      const Color.fromARGB(255, 230, 24, 106),
                                  colorEnd:
                                      const Color.fromARGB(255, 214, 151, 175),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                DiscountCard(
                                  discountAmount: "15% off",
                                  discountUpto: "upto 250 AED",
                                  colorStart:
                                      const Color.fromARGB(255, 186, 20, 215),
                                  colorEnd:
                                      const Color.fromARGB(255, 214, 151, 175),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Move SliverPersistentHeader here
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                      TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        labelColor: Colors.pink,
                        unselectedLabelColor: Colors.grey,
                        tabs: categories
                            .map((category) => Tab(text: category))
                            .toList(),
                        onTap: (index) {
                          final offset = _getCategoryOffset(index);
                          _scrollController.animateTo(
                            offset,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInQuad,
                          );
                        },
                      ),
                    ),
                  ),

                  // Menu Items
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final category = categories[index];
                        final categoryItems = foodItemList.where((item) {
                          return item.category == category;
                        }).toList();
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(6.w),
                              child: AppTextstyle(
                                text: category,
                                style: appStyle(
                                    size: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            ...categoryItems.map((item) => MenuItemCard(
                                  foodItem: item,
                                )),
                          ],
                        );
                      },
                      childCount: categories.length,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
