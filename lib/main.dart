import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/menu_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MakanYuk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 255, 153, 0),
        ),
        useMaterial3: true,
      ),
      home: const MenuListPage(),
    );
  }
}