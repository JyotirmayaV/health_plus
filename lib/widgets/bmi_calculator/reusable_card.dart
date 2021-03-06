import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color containerColor;
  final Widget cardChild;
  final Function onPress;

  ReusableCard({@required this.containerColor, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: containerColor,
        ),
      ),
    );
  }
}
