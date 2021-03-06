import 'package:flutter/material.dart';
import 'package:Health_Plus/constants.dart';

class ReusableCardChild extends StatelessWidget {
  final IconData childContainerIcon;
  final String childContainerText;

  ReusableCardChild(
      {@required this.childContainerIcon, this.childContainerText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          childContainerIcon,
          size: 60.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          childContainerText,
          style: kBmiLabelTextStyle,
        ),
      ],
    );
  }
}
