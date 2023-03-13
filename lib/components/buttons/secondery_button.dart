import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class SeconderyButton extends StatelessWidget {
  const SeconderyButton({
    Key? key,
    required this.child,
    required this.press,
  }) : super(key: key);

  final Widget child;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: 12),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: child,
        ),
      ),
    );
  }
}
