import 'package:flutter/material.dart';
import 'package:visa_form/screens/application_form.dart';
import 'package:visa_form/screens/notification_pop_up.dart';
import 'package:visa_form/screens/responsive_tab_bar.dart';
import 'package:visa_form/screens/responsive_tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: ResponsiveTabView(),
    );
  }
}
