import 'package:flutter/material.dart';
import 'package:simplone_final/pages/homeScreen/components/categories.dart';
import 'package:simplone_final/pages/homeScreen/components/nav_bar.dart';
import 'package:simplone_final/pages/homeScreen/components/task.dart';
import 'package:simplone_final/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.06),
        height: sizeHeight,
        width: sizeWidth,
        child: Column(
          children: [
            NavBar(),
            Categories(),
            Task(),
          ],
        ),
      ),
    );
  }
}
