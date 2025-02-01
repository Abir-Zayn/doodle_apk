import 'package:doodle_apk_test/page/Auth/screen/app_login_screen.dart';
import 'package:doodle_apk_test/page/Auth/screen/app_register_screen.dart';
import 'package:doodle_apk_test/page/Cart/Screen/cart_screen.dart';
import 'package:doodle_apk_test/page/Detailed/Screen/food_details.dart';
import 'package:doodle_apk_test/page/Detailed/Screen/restaurant_profile.dart';
import 'package:doodle_apk_test/page/Home/screen/home_screen.dart';
import 'package:doodle_apk_test/page/Splash/screen/logo_display.dart';
import 'package:doodle_apk_test/page/Splash/screen/splash_screen_one.dart';
import 'package:doodle_apk_test/page/Splash/screen/splash_screen_two.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GoRouter _router =
    GoRouter(navigatorKey: navigatorKey, initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const LogoDisplay(),
  ),
  GoRoute(
    path: '/splash_one',
    builder: (context, state) => const SplashScreenOne(),
  ),
  GoRoute(
    path: '/splash_two',
    builder: (context, state) => const SplashScreenTwo(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const AppLoginScreen(),
  ),
  GoRoute(
      path: '/signup', builder: (context, state) => const AppRegisterScreen()),
  GoRoute(
    path: '/home',
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/restaurant_info',
    builder: (context, state) => RestaurantProfile(),
  ),
  GoRoute(
    path: '/hasVarient',
    builder: (context, state) {
      final extra = state.extra as Map<String, dynamic>;
      return FoodDetailScreen(
        imageUrl: extra['imageUrl']!,
        foodName: extra['foodName']!,
        foodDescription: extra['foodDescription']!,
        foodPrice: double.parse(extra['foodPrice']!),
      );
    },
  ),
  GoRoute(
    path: '/cart',
    builder: (context, state) => const CartScreen(),
  ),
]);

GoRouter get appRouter => _router;
