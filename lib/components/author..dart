import 'package:flutter/material.dart';

Widget authorBox(
    {required double height, required String author, required Color color}) {
  return Container(
    height: height * 0.210,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
    ),
    alignment: Alignment.center,
    child: Text(
      author,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
