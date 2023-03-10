import 'package:flutter/material.dart';
import 'package:learn_parsing_data_json_dart/pages/dio_display_screen.dart';
import 'pages/display_data.dart';
import 'pages/home_page.dart';
import 'pages/home_stateless_future_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(),
      home: const DioDisplayUser(),
    );
  }
}


