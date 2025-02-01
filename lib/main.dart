import 'package:doodle_apk_test/common/utils/app_routes.dart';
import 'package:doodle_apk_test/page/Detailed/controller/tabState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Tabstate()),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Some of system settings mainly responsible for the top app bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.pink, // Set the color of the status bar
      statusBarIconBrightness: Brightness.dark, // For Android: use dark icons
      statusBarBrightness: Brightness.light, // For iOS: use light icons
    ));
    Size screensize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screensize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Main App',
          routerConfig: appRouter,
        );
      },
    );
  }
}
