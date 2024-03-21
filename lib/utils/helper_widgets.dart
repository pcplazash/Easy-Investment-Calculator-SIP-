import 'package:flutter/material.dart';


Widget addVerticalSpace(BuildContext context, double height) {
  final deviceHeight = MediaQuery.of(context).size.height;
  return SizedBox(height: deviceHeight * height);
}

Widget addHorizontalSpace(BuildContext context, double width) {
  final deviceWidth = MediaQuery.of(context).size.width;
  return SizedBox(width: deviceWidth * width);
}
