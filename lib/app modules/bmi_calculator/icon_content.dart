import 'package:flutter/material.dart';

class ReusableCardChild extends StatelessWidget {
  final IconData childContainerIcon;
  final String childContainerText;

  ReusableCardChild(
      {@required this.childContainerIcon, this.childContainerText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          childContainerIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          childContainerText,
          style: TextStyle(
            fontSize: 17.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color containerColor;
  final Widget cardChild;

  ReusableCard({@required this.containerColor, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: containerColor,
      ),
    );
  }
}
