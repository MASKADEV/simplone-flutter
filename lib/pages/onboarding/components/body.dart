import 'package:flutter/material.dart';
import 'package:simplone_final/pages/authentication/signIn/sign_in_screen.dart';
import 'package:simplone_final/utils/size_config.dart';

import '../../../utils/constants.dart';
import '../../../components/buttons/primary_button.dart';
import '../../../components/widgets/dot_indicators.dart';
import 'onboard_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Column(
        children: [
          Spacer(flex: 2),
          Expanded(
            flex: 14,
            child: PageView.builder(
              itemCount: Details.length,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (context, index) => OnboardContent(
                illustration: Details[index]["illustration"],
                title: Details[index]["title"],
                text: Details[index]["text"],
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(Details.length,
                (index) => DotIndicator(isActive: index == currentPage)),
          ),
          Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: PrimaryButton(
              press: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              text: "Commencer",
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

// Demo data for our Onboarding screen
List<Map<String, dynamic>> Details = [
  {
    "illustration": "assets/Illustrations/Illustrations_1.svg",
    "title": "Learn Smarter, Not Harder",
    "text":
        "Experience the convenience and effectiveness of e-learning with our interactive and engaging app.",
  },
  {
    "illustration": "assets/Illustrations/Illustrations_2.svg",
    "title": "Flexible Learning Anytime, Anywhere",
    "text":
        "Access your courses and learning materials from the comfort of your own space at any time of the day.",
  },
  {
    "illustration": "assets/Illustrations/Illustrations_3.svg",
    "title": "Customized Learning Experience",
    "text":
        "Tailor your learning experience to suit your needs and interests, and learn at your own pace.",
  }
];
