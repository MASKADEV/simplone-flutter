// ignore_for_file: avoid_print, prefer_final_fields, unused_import

import 'package:flutter/material.dart';
import 'package:simplone_final/pages/addTask/add_task.dart';
import 'package:simplone_final/pages/briefDetails/DetailsPage.dart';
import 'package:simplone_final/services/firebase.dart';
import 'package:simplone_final/utils/colors.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List<dynamic>? briefs = [];
  FirebaseHandler _firebaseHandler = FirebaseHandler();

  void getBriefs() async {
    List<dynamic> tasks = await _firebaseHandler.getBriefs();
    setState(() {
      briefs = tasks;
    });
    print(briefs?[0]['image']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBriefs();
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: sizeHeight * 0.03,
        ),
        const Text(
          "Current Briefs",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        Container(
          height: sizeHeight * 0.5,
          width: sizeWidth,
          padding: EdgeInsets.only(top: sizeHeight * 0.03),
          child: ListView.builder(
              itemCount: briefs!.length,
              itemBuilder: (context, index) {
                return Container(
                  height: sizeHeight * 0.08,
                  margin: EdgeInsets.only(bottom: sizeHeight * 0.01),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: sizeHeight * 0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              briefs![index]['title'],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  decoration: briefs![index]['done'] == true
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                            Text(
                              briefs![index]['time'],
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contxt) => DetailsPage(
                                        briefDetails: briefs![index],
                                      )));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          height: sizeHeight * 0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'More',
                              style: TextStyle(
                                  wordSpacing: 2,
                                  fontSize: 15,
                                  color: Colors.green),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
