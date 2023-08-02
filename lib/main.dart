import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'Attendance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Student Attendance',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AttendanceScreen(),
      ),
      designSize: const Size(360, 800),
    );
  }
}
