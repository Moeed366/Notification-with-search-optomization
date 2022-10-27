import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notification_with_search/view/Notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

        designSize: const Size(414, 896),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context , child) {
          return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Notification',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: Notify(),
      );}
    );
  }
}

