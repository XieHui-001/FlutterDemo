import 'package:flutter/material.dart';
import 'package:tools/start/startpage.dart';
import 'package:get/get.dart';

import 'home/details/detailspage.dart';
import 'home/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),useMaterial3: true),
      title: "株式スクリーニングの専門家",
      initialRoute: "/",
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(name: "/", page: ()=> const MyApp()),
        GetPage(name: "/start", page: ()=>  const StartPage(),transition: Transition.rightToLeft),
        GetPage(name: "/detail", page: ()=> DetailsPage(),transition: Transition.rightToLeft),
        GetPage(name: "/home", page: () => HomePage(),transition: Transition.rightToLeft),
      ],
      home:  const StartPage(),
    );
  }
}
