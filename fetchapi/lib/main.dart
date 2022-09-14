import 'package:fetchapi/view/user_details.dart';
import 'package:get/get.dart';
import 'package:fetchapi/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: (() => const HomePage())),
        GetPage(name: "/userdetails",page: (() => const UserDetail()),
        ),
      ],
    );
  }
}
