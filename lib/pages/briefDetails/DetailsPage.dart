// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:simplone_final/utils/size_config.dart';

class DetailsPage extends StatefulWidget {
  final briefDetails;
  const DetailsPage({super.key, this.briefDetails});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            Container(
              child: Image(image: NetworkImage(widget.briefDetails['image'])),
            ),
            Container(
              padding: EdgeInsets.all(SizeConfig.screenHeight * 0.01),
              child: Column(
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.briefDetails['title'],
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          widget.briefDetails['time'],
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.briefDetails['desc'],
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
